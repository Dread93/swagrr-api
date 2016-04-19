class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :dog
  validates :post, presence: true
  validates :dog, presence: true
  validates :body, presence: true, length: { maximum: 500 }
end
