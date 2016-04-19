class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :caption, :location
  has_one :dog
  has_many :comments
  has_many :likes
end
