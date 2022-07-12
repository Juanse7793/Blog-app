class LikesController < ApplicationController
  def like
    @post = Post.find(params[:id])
    Like.new(author: current_user, post: @post).save
    redirect_to user_post_path(current_user, @post)
  end
end
