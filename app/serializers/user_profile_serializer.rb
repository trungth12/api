class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
