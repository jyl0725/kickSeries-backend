class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :story
  has_many :project_users
  has_many :users ,through: :project_users
end
