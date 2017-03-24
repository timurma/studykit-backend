class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :email, case_sensitive: false

  def self.find_by_email_password(email, password)
    user = where('LOWER(email) = ?', email.downcase).first
    return user if user && user.password == password
  end

  def self.find_by_token(token)
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    payload = decoded_token.first
    User.find_by(id: payload['user_id'])
  rescue JWT::ExpiredSignature, JWT::DecodeError
    nil
  end

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def issue_token
    exp = 3.days.from_now.to_i
    payload = { user_id: id, exp: exp }
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
  end
end
