class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
end
