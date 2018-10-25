class Project < ApplicationRecord
  has_many :project_users
  has_many :users ,through: :project_users
  validates :title, uniqueness: { case_sensitive: false }
  validates :title, presence: true
end
