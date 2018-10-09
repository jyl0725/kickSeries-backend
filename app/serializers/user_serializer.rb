class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :role
  has_many :project_users
  has_many :projects , through: :project_users
end
