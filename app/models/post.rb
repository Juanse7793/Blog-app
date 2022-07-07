class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :post_count

  def five_last_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def post_count
    author.update(posts_counter: author.posts.count)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
