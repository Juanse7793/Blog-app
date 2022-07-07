require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'hola', posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post title', text: 'body', comments_counter: 0, likes_counter: 0)
    @post.save
    @like = Like.new(author: @user, post: @post)
    @like.save
  end

  it 'has author' do
    expect(@post.author).to eq(@user)
  end

  it 'has post' do
    expect(@like.post).to eq(@post)
  end
end
