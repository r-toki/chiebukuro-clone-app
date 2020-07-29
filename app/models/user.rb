class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # User has password, password_confirmation attrs.
  # User has authenticate method.
  has_secure_password
end
