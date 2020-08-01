class User < ApplicationRecord

  has_many :questions, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true

  validates :password, presence: true,
                       # When created, allow_nil: false.
                       # Because has_secure_passowrd validates.
                       allow_nil: true,
                       length: { minimum: 6 }

  # has_secure_passowrd
  # 1. User has password, password_confirmation attrs.
  # 2. User has authenticate method.
  has_secure_password

end
