class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.all
  end

  def show; end
end
