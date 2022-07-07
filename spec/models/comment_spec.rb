require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'hola', posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post title', text: 'body', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.new(author: @user, text: 'comment', post: @post)
    @comment.save
  end

  it 'text always valid' do
    @comment.text = 'comment'
    expect(@comment).to be_valid
  end

  it 'text always valid' do
    @comment.text = nil
    expect(@comment).to be_valid
  end

  it 'has author' do
    expect(@comment.author).to eq(@user)
  end

  it 'has post' do
    expect(@comment.post).to eq(@post)
  end
end
