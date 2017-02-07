require "bcrypt"

class User < ActiveRecord::Base
  belongs_to :company

  def password=(new_password)
    @password = new_password
    self.encrypted_password = BCrypt::Password.create(@password)
  end

  def password
    @password
 end

  def valid_password?(password_to_validate)
    BCrypt::Password.new(encrypted_password) == password_to_validate
  end
end
