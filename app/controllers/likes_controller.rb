class LikesController < ApplicationController
  def like
    @user = current_user
    @post = Post.find(params[:id])
    if already_liked?
      redirect_to user_post_path(current_user, @post)
    else
      @like = Like.new(author: @user, post: @post)
      @like.save
      redirect_to user_post_path(current_user, @post)
    end
  end

  def already_liked?
    Like.where(author: current_user, post: @post).exists?
  end
end
