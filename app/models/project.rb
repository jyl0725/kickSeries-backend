class Project < ApplicationRecord
  has_many :project_users
  has_many :users ,through: :user
end