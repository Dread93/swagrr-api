class DogSerializer < ActiveModel::Serializer
  attributes :id, :handle, :name, :bio, :sex, :website
  has_one :user
  has_one :breed
  has_many :posts
  has_many :following
  has_many :followers
end
