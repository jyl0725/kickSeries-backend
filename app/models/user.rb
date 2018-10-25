class User < ApplicationRecord
  has_many :project_users
  has_many :projects , through: :project_users
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :role, presence:true
  has_secure_password
end
