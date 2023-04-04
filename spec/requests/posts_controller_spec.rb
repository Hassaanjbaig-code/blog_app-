require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe PostsController, type: :request do
  describe 'GET /posts' do
    before(:example) { get '/users/1/posts' }
    it 'should check the responce is comming' do
      expect(response).to have_http_status(:ok)
    end
    it('is correct template rendered') do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /posts/:id' do
    before(:example) { get '/users/1/posts/1' }
    it 'should check the responce is comming' do
      expect(response).to have_http_status(:ok)
    end
    it('is correct template rendered') do
      expect(response).to render_template(:show)
    end
    it('is response body includes correct placeholder text') do
      expect(response.body).to include('Show the detail of the post')
    end
  end
end
