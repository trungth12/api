class UserPolicy < ApplicationPolicy
  def me?
    app_user.is_signed_in?
  end
end