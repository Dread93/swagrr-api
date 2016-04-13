class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :post
  has_one :dog
end
