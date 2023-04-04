require 'rails_helper'

RSpec.describe UsersController, type: :request do
    describe 'GET /users' do
        before do
            @user = User.create(name: 'Raihan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                bio: 'Teacher from Bangla.', postscounter: 0)
        end
        it 'should return the users' do
            get users_path
            expect(response).to have_http_status(:ok)
        end
        # it 'should return the user' do
        #     get '/users/1'
        #     expect(response).to have_http_status(:ok)
        # end
        # it 'should return the user posts' do
        #     get '/users/1/posts'
        #     expect(response).to have_http_status(:ok)
        # end
        # it 'should return the user post' do
        #     get '/users/1/posts/1'
        #     expect(response).to have_http_status(:ok)
        # end
    end
end