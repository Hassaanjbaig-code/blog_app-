class CommentsController < ApplicationController
  def new
    @user = current_user(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = current_user(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(
      author: @user,
      post: @post,
      text: params[:comment][:text]
    )
    if @comment.save
      redirect_to user_post_path(@user, @post, @comment),
      notice: 'Comment was successfully created.'
    else
      render :new
      flash[:alert] = 'Comment was not created.'
    end
end
end