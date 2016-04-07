class Api::V1::UsersController < RootController
  before_action :doorkeeper_authorize!

  def me
    authorize app_user
    render json: app_user, serializer: UserProfileSerializer
  end


end