require 'rails_helper'

RSpec.describe Post, type: :model do

    before :each do
      @user = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'hola', posts_counter: 0)
      @post = Post.new(author: @user, title: 'Post title', text: 'body', comments_counter: 0, likes_counter: 0)
      @post.save
    end

    it 'title should be present' do
        @post.title = nil
        expect(@post).to_not be_valid
    end

    it 'title length should be less than 250' do
        @post.title = 'a' * 251
        expect(@post).to_not be_valid
    end

    it 'comments_counter greater or equal to zero' do
        @post.comments_counter = -1
        expect(@post).to_not be_valid
    end

    it 'likes_counter always integer' do
        @post.likes_counter = 0.5
        expect(@post).to_not be_valid
    end

    it 'likes_counter greater or equal to zero' do
        @post.likes_counter = -1
        expect(@post).to_not be_valid
    end

    it 'comments_counter always integer' do
        @post.comments_counter = 0.5
        expect(@post).to_not be_valid
    end

    it 'text always valid' do
        @post.text = 'body'
        expect(@post).to be_valid
    end

    it 'text always valid' do
        @post.text = nil
        expect(@post).to be_valid
    end
end