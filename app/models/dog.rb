class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  has_many :posts
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followee_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followee
  has_many :followers, through: :passive_relationships
  validates :handle, presence: true, length: { in: 2..15 }
  validates :bio, length: { maximum: 500 }
  validates :user, presence: true

  # Safest way to do this I guess
  def handle=(dog_handle)
    write_attribute(:handle, dog_handle.downcase)
  end

  # Follows a dog
  def follow(other_dog)
    active_relationships.create(followee_id: other_dog.id)
  end

  # Unfollows a dog
  def unfollow(other_dog)
    active_relationships.find_by(followee_id: other_dog.id).destroy
  end

  # Returns true if the current dog is following the other dog
  def following?(other_dog)
    following.include?(other_dog)
  end
end
