class RootPolicy < ApplicationPolicy
  def index?
    app_user.is_signed_in?
  end
end