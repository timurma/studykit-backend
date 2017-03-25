class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar, :role, :jwt_token

  # TODO: remove jwt_token from each user, insert it only on login
  def jwt_token
    instance_options[:jwt_token]
  end

  def avatar
    "#{instance_options[:host]}#{object.avatar.url}" if object.avatar?
  end
end
