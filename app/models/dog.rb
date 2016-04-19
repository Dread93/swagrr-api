class Dog < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://s-media-cache-ak0.pinimg.com/236x/56/ba/94/56ba94f766b05ac067d89e4a2d364c63.jpg"
  validates_attachment :avatar,
                       :content_type => {:content_type => /\Aimage\/.*\Z/}
  belongs_to :user
  belongs_to :breed
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followee_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followee
  has_many :followers, through: :passive_relationships
  validates :handle, presence: true, length: { in: 2..15 },
                     format: { with: /[[A-Za-z]+[A-Za-z0-9_]*$]/ },
                     uniqueness: true
  validates :bio, length: { maximum: 500 }
  validates :user, presence: true

  HANDLE_REGEX = /(?<=^|(?<=[^a-zA-Z0-9\-_\.]))@([[A-Za-z]+[A-Za-z0-9_]*$]{2,15})/
  

  def as_json(options)
    super(:methods => [:avatar_url])
  end


  def avatar_url
    avatar.url
  end



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
