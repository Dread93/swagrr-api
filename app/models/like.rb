class Like < ApplicationRecord
  belongs_to :post
  belongs_to :dog
  validates :dog, presence: true
  validates :post, presence: true
  validates :dog_id, uniqueness: {scope: :post_id}
end
