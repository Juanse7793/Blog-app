class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      puts @post
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    Like.new(author: current_user, post: @post).save
    redirect_to user_post_path(current_user, @post)
  end

  def comment
    @post = Post.find(params[:id])
    p params
    @comment = Comment.new(author: current_user, post: @post, text: params[:text])
    @comment.save
    redirect_to user_post_path(current_user, @post)
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
