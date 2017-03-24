class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar, :role, :jwt_token

  def jwt_token
    instance_options[:jwt_token]
  end

  def avatar
    "#{instance_options[:host]}#{object.avatar.url}" if object.avatar?
  end
end
