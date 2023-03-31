require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Bangla.', postscounter: 0)
    @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first post', commentscounter: 0,
                        likescounter: 0)
  end

  describe 'update_post_comments_counter' do
    it 'should update post commentscounter after creating a new Comment' do
      Comment.create(author: @user, post: @post, text: 'This is my first comment')
      expect(@post.commentscounter).to eq(1)
    end
    it 'should return the text' do
      comment = Comment.create(author: @user, post: @post, text: 'This is my first comment')
      expect(comment.text).to eq('This is my first comment')
    end
  end
end
