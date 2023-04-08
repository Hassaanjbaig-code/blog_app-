class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @user = current_user(params[:user_id])
    @post = Post.new
  end
  def create
    @user = current_user(params[:user_id])
    @post = Post.new(
      author: @user,
      title: params[:post][:title],
      text: params[:post][:text]
    )
    if @post.save
      redirect_to user_posts_path(@user, @post),
      notice: 'Post was successfully created.'
    else
      render :new
      flash[:alert] = 'Post was not created.'
    end
  end
end
