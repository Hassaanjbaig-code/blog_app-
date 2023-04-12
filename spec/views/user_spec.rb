require 'rails_helper'


RSpec.describe User, type: :system do
  describe 'index' do
    before do
      @user = User.create(name: 'Raihan', photo: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=MnwxM[%E2%80%A6]8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80',
                          bio: 'Teacher from Bangla.', postscounter: 1,
                          created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      Post.create(author: @user, title: 'Hello World', text: 'This is my first @post',
                  commentscounter: 0, likescounter: 0)
      visit '/users'
    end
    it 'shaould have a name' do
      expect(page).to have_content('Raihan')
    end
    it 'I can see the number of posts each user has' do
      expect(page).to have_content('Number of posts: 1')
    end
    it 'When I click on a user name, I am taken to the user show page' do
      click_link @user.name
      expect(page).to have_content(@user.name)
    end
  end
  describe 'show' do
    before do
      @user = User.create(name: 'Raihan', photo: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=MnwxM[%E2%80%A6]8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80',
                          bio: 'Teacher from Bangla.', postscounter: 1,
                          created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      Post.create(author: @user, title: 'Hello World', text: 'This is my first @post',
                  commentscounter: 0, likescounter: 0)
      Comment.create(author: @user, post: @user.posts.first, text: 'This is my first comment')
      visit user_path(@user)
    end
    it 'shaould have a name' do
      expect(page).to have_content('Raihan')
    end
    it 'should have a bio' do
      expect(page).to have_content('Teacher from Bangla.')
    end
    it 'should have a photo' do
      expect(page.find('img')[:src]).to eq(@user.photo)
    end
    it 'should have a number of posts' do
      expect(page).to have_content('Post # 1')
    end
    it 'should have a number of comments' do
      expect(page).to have_content('comments: 1')
    end
    it 'should have a number of likes' do
      expect(page).to have_content('likes: 0')
    end
    it 'should have a list of posts' do
      click_link 'See All Posts'
      sleep 2
      expect(page).to have_content('This is my first @post')
    end
    it "I can see the user's first 3 posts" do
      @post2 = Post.create(title: 'title2', text: 'content2', author: @user)
      @post3 = Post.create(title: 'title3', text: 'content3', author: @user)
      @post4 = Post.create(title: 'title4', text: 'content4', author: @user)
      sleep 2
      expect(page.find_all('div h3').length).to eq(3)
    end
  end
end
