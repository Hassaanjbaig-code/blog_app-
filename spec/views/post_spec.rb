require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'index' do
    before do
      @user = User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Bangla.', postscounter: 1,
        created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      @post = Post.create(author: @user, title: 'Hello World', text: 'This is my first post',
        commentscounter: 0, likescounter: 0)
    end

    it 'shows the right content' do
        visit user_posts_path(@user, @post)
        expect(page).to have_content(@user.name)
    end
  end
end


RSpec.describe '/posts', type: :request do
    describe 'GET /index' do
      before(:example) do
        @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio')
        @post = Post.create(title: 'title', text: 'content', author: @user)
        get user_posts_path(@user)
      end
      it 'renders a successful response' do
        expect(response).to be_successful
      end
      it 'correctly renders the index template' do
        expect(response).to render_template(:index)
      end
      it 'contain the placeholder text' do
        expect(response.body).to include('John Doe')
      end
    end
end