class Post < ApplicationRecord
    belongs_to :author , class_name: "User"
    has_many :comments
    has_many :likes

    def five_last_comments
        comments.order(created_at: :desc).limit(5)
    end

    def post_count
        author.update(posts_counter: author.posts.count)
    end
end
