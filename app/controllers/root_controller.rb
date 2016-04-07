class RootController < ApplicationController
  include Pundit
  include Auth

  after_action :verify_authorized

  protect_from_forgery with: :null_session

  if Rails.env.production?
    rescue_from Exception, with: :render_500
  end
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  def index
    authorize :root
    render json: {message: "Restricted Resource"}
  end

  protected

  # Find the user that owns the access token
  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def render_json_message(message)
    render json: {message: message}
  end

  def render_json_error(resource, message = nil)
    if message.blank?
      message = error_message_for_save(resource)
    end
    render json: {message: message, errors: resource.errors}, status: 400
  end

  def render_json_error_message(message, status = 400)
    render json: {message: message, errors: []}, status: status
  end

  def raise_permission_denied_exception(message = "")
    raise Pundit::NotAuthorizedError, message
  end

  def permission_denied(exception)
    render_json_error_message "Invalid access", 403
  end

  def error_message_for_save(resource)
    "#{pluralize(resource.errors.count, 'error')} prohibited this #{resource.model_name.human.downcase} from being saved"
  end

  def resource_not_found(exception)
    render_json_error_message "Invalid ID"
  end

  def render_500(exception)
    render_json_error_message "An internal server error has occurred, our engineers have been notified and are working to resolve the issue."
  end
end