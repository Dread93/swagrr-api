class DogSerializer < ActiveModel::Serializer
  attributes :id, :handle, :avatar_url, :name, :bio, :sex, :website
  has_one :user
  has_one :breed
end
