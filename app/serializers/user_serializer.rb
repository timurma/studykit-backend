class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :avatar, :jwt_token

  def jwt_token
    instance_options[:jwt_token]
  end
end
