class Hashtag < ApplicationRecord
  has_many :post_hastags
  has_many :posts, through: :post_hashtags

  HASHTAG_REGEX = /(?:\s|^)(#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$))([a-z0-9\-_]+))/i
end
