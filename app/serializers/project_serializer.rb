class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :story
  has_many :project_users
  has_many :users ,through: :user
end
