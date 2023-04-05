require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe PostsController, type: :request do
  describe 'GET /posts' do
    before(:example) { get '/users/:id/posts' }
    it 'should check the responce is comming' do
      expect(response).to have_http_status(:ok)
    end
    it('is correct template rendered') do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /posts/:id' do
    # before(:example) { get '/users/:users_id/posts/1' }
    before do
      @user = User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Bangla.', postscounter: 1,
                          created_at: '2023-03-30 12:47:48.768257', updated_at: '2023-03-30 12:47:48.768257')
      Post.create(author: @user, title: 'Hello World', text: 'This is my first @post',
                          commentscounter: 0, likescounter: 0)
    end
    it 'should check the responce is comming' do
      get '/users/:users_id/posts/1'
      expect(response).to have_http_status(:ok)
    end
    it('is correct template rendered') do
      get '/users/:users_id/posts/1'
      expect(response).to render_template(:show)
    end
    it('is response body includes correct placeholder text') do
      get '/users/:users_id/posts/1'
      expect(response.body).to include('Show the detail of the post')
    end
  end
end
