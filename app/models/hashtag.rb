class Hashtag < ApplicationRecord
  has_many :post_hastags
  has_many :posts, through: :post_hashtags
  validates :name, presence: true

  HASHTAG_REGEX = /(?:\s|^)(#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$))([a-z0-9\-_]+))/i

  # Safest way to do this I guess
  def name=(tag_name)
    write_attribute(:name, tag_name.downcase)
  end
end
