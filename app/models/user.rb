class User < ActiveRecord::Base
#   1. password required only on create not on update
#   2. password length should be less than or equal to 72 characters
#   3. Confirmation of password (using a password_confirmation attribute)
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: true, format: {with:EMAIL_REGEX}
  validates :name, :email, presence:true
  before_save :downcase_fields

  def downcase_fields
      self.email.downcase!
  end

end
