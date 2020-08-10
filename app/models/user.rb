class User < ApplicationRecord

  has_many :questions

  has_secure_password
  # 1. password, password_confirmation 属性の追加
  # 2. authenticate method の追加
  # 3. validation の追加
  #   1. create 時 password が存在すること
  #   2. password の長さが 72 byte 以下であること
  #   3. password == password_confirmation であること

  validates :name, presence: true,
                   uniqueness: true

  validates :password, presence: true,
                       allow_nil: true,
                       length: { minimum: 6 }

end
