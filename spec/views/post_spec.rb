require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe Post, type: :system do
  describe 'index' do
    before do
      @user = User.create(name: 'Raihan', photo: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=MnwxM[%E2%80%A6]8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80',
                          bio: 'Teacher from Bangla.', postscounter: 1,
                          created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first post')
      visit user_posts_path(@user, @post)
    end

    it 'shows the right content test the name is present' do
      expect(page).to have_content(@user.name)
    end
    it 'shows the right content test the post is present' do
      expect(page).to have_content(@post.text)
    end
    it 'show the image of the user' do
      expect(page.find('img')[:src]).to eq(@user.photo)
    end
    it 'should have a Comment ' do
      expect(page).to have_content('Comment')
    end
    it 'I can see the number of comments' do
      expect(page).to have_content('omments: 0')
    end
    it "I can see the user's first 3 posts" do
      sleep 1
      expect(page.find_all('li h2').length).to eq(1)
    end
    it "is displayed when there are more posts than fit on the view" do
      10.times do |i|
        Post.create!(author:@user, title: "Post #{i + 1}", text: "Lorem ipsum dolor sit amet.")
      end
        sleep 2
        visit user_posts_path(@user)
        expect(page).to have_selector(".pagination")
      end
    it 'I can see the number of likes' do
      expect(page).to have_content('likes: 0')
    end
    it 'When I click on the post I see the detail post' do
      click_link 'This is my first post'
      sleep 1
      expect(page).to have_content("Post #{@post.id} by #{@user.name}")
    end
  end
  describe 'show' do
    before do
      @user = User.create(name: 'Raihan', photo: 'https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=MnwxM[%E2%80%A6]8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80',
                          bio: 'Teacher from Bangla.', postscounter: 1,
                          created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first post',
                          commentscounter: 0, likescounter: 0)
      @comment = Comment.create(author: @user, post: @post, text: 'This is my first comment')
      visit user_post_path(@user, @post)
    end
    it 'Post text is present' do
      expect(page).to have_content(@post.text)
    end
    it 'When I click on the post I see the detail post' do
      expect(page).to have_content("Post #{@post.id} by #{@user.name}")
    end
    it 'I can see the number of comments' do
      expect(page).to have_content('comments: 1')
    end
    it 'I can see the number of likes' do
      expect(page).to have_content('likes: 0')
    end
    it 'I can see the comment' do
      expect(page).to have_content(@comment.text)
    end
    it 'Add like button ' do
      click_button '👍'
      sleep 2
      expect(page).to have_content('likes: 1')
    end
  end
end
