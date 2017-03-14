class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :password_digest

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
