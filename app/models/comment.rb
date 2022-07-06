class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :comment_count

  private

  def comment_count
    post.update(comments_counter: post.comments.count)
  end
end
