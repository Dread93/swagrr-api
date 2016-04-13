class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :caption, :location
  has_one :dog
end
