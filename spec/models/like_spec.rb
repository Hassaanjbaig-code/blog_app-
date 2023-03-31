require 'rails_helper'

RSpec.describe Like, type: :model do
    before do
        @user =User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Bangla.', postscounter: 0)
        @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first post', commentscounter: 0, likescounter: 0)
    end
    
    
    describe 'update_post_likes_counter' do
        it 'should update post likescounter after creating a new Like' do
        Like.create(author: @user, post: @post)
        expect(@post.likescounter).to eq(1)
      end
    end
end

# RSpec.describe Like, type: :model do
#     describe "#update_post_likes_counter" do
#       let!(:user) { User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Bangla.', postscounter: 0) }
#       let!(:post) { Post.create(author: user, title: 'Hello World', text: 'This is my first post') }
#       let!(:like) { Like.create(author: user, post: post) }
  
#       it "updates the likes counter of the associated post" do
#         expect {
#           like.update_post_likes_counter
#           post.reload
#         }.to change { post.LikesCounter }.from(0).to(1)
#       end
#     end
# end
  