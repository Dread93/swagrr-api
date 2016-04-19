class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :dog
  validates :post, presence: true
  validates :dog, presence: true
  validates :body, presence: true, length: { maximum: 500 }
  before_save :update_mentions

  # Probs a better way to do this but whatevz
  def update_mentions
    post.update_mentions
  end

  def get_mentions
    parsed_mentions
  end

  def parsed_mentions
    parsed_mentions = []
    mention_array = scan_for_mentions(body)
    mention_array.each do |mention|
      parsed_mentions << Dogss.find_by_name(mention[1])
    end
    parsed_mentions
  end

  def scan_for_mentions(words)
    reg = words.scan(Dog::HANDLE_REGEX)
    reg.uniq!
    reg
  end
end
