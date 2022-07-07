require 'rails_helper'

RSpec.describe User, type: :model do

    before :each do
      @user = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'hola', posts_counter: 0)
      @user.save
    end

    it 'name should be present' do
        @user.name = nil
        expect(@user).to_not be_valid
    end

    it 'photo always valid' do
        @user.photo = nil
        expect(@user).to be_valid
    end

    it 'photo always valid' do
        @user.photo = 'https://example.com/photo.jpg'
        expect(@user).to be_valid
    end

    it 'bio always valid' do
        @user.bio = nil
        expect(@user).to be_valid
    end

    it 'bio always valid' do
        @user.bio = 'hola'
        expect(@user).to be_valid
    end

    it 'posts_counter greater or equal to zero' do
        @user.posts_counter = -1
        expect(@user).to_not be_valid
    end

    it 'posts_counter always integer' do
        @user.posts_counter = 0.5
        expect(@user).to_not be_valid
    end
end