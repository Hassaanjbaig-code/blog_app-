require 'rails_helper'

RSpec.describe @post, type: :model do
  before do
    @user = User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Bangla.', postscounter: 1,
                        created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
    @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first @post',
                        commentscounter: 0, likescounter: 0)
  end

  it 'title should be present' do
    check = @user.valid?

    expect(check).to eq(true)
  end
  it 'title should be Hello' do
    expect(@post.title).to eq('Hello World')
  end
  it 'text should be This is my first @post' do
    expect(@post.text).to eq('This is my first @post')
  end
  it 'title should not be empty' do
    @post.title = ''
    expect(@post).to_not be_valid
  end
  it 'title should be between 6 to 25 characters' do
    @post.title = 'Hello'
    expect(@post).to_not be_valid
  end
  it '@posts_counter should be greater than or equal to zero' do
    @post.commentscounter = 1

    expect(@post.commentscounter).to be >= 0
  end

  it 'likes_counter should be greater than or equal to zero' do
    @post.likescounter = 1

    expect(@post.likescounter).to be >= 0
  end
  it 'update_author_posts_counter' do
    expect(@post.author.postscounter.to_i).to eq(1)
  end
  it '#recent_comments should show 5 recent comments on @post' do
    Comment.create(author: @user, post: @post, text: 'This is my first comment')
    Comment.create(author: @user, post: @post, text: 'This is my first comment')
    Comment.create(author: @user, post: @post, text: 'This is my first comment')
    Comment.create(author: @user, post: @post, text: 'This is my first comment')
    Comment.create(author: @user, post: @post, text: 'This is my first comment')
    recent_comments = @post.recent_comments

    expect(recent_comments.size).to eq(5)
  end
end
