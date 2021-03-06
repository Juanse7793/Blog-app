class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  after_initialize :post_count_value, :default_photo

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def post_count_value
    self.posts_counter ||= 0
  end

  def default_photo
    self.photo ||= 'https://i.stack.imgur.com/YQu5k.png'
  end
end
