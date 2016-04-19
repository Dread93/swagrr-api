class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Dog"
  belongs_to :followee, class_name: "Dog"
  validates :follower_id, presence: true
  validates :followee_id, presence: true
  validates :follower_id, uniqueness: {scope: :followee_id}
end
