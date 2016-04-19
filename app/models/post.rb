class Post < ApplicationRecord
  belongs_to :dog
  has_many :likes
  has_many :comments
  has_many :post_hastags
  has_many :hashtags, through: :post_hashtags
  has_many :mentions
  has_many :dogs, through: :mentions
  validates :dog, presence: true
  validates :image_url, presence: true
  validates :caption, length: { maximum: 500 }
  before_save :update_hashtags
  before_save :update_mentions

  def update_hashtags
    self.hashtags = parsed_hashtags
  end

  def parsed_hashtags
    parsed_hashtags = []
    hashtag_array = scan_for_hashtags(caption)
    hashtag_array.each do |tag|
      parsed_hashtags << Hashtag.find_or_create_by_name(tag[1])
    end
    parsed_hashtags
  end

  def scan_for_hashtags(words)
    reg = words.scan(Hashtag::HASHTAG_REGEX)
    reg.uniq!
    reg
  end

  def update_mentions
    self.dogs = parsed_mentions
  end

  def parsed_hashtags
    parsed_mentions = []
    mention_array = scan_for_mentions(caption)
    mention_array.each do |mention|
      parsed_mentions << Dogss.find_by_name(mention[1])
    end
    parsed_mentions
  end

  def scan_for_hashtags(words)
    reg = words.scan(Dog::HANDLE_REGEX)
    reg.uniq!
    reg
  end
end
