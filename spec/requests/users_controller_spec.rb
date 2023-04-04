require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe UsersController, type: :request do
    describe 'GET /users' do
        before(:example) { get '/users'}
        it 'should check the responce is comming' do
            expect(response).to have_http_status(:ok)
        end
        it('is correct template rendered') do
            expect(response).to render_template(:index)
        end
        it 'should check the responce is comming' do
            expect(response.body.size).to eq(6635)
        end
    end
    describe 'GET /users/:id' do
        before(:example) { get '/users/1'}
        it 'should check the responce is comming' do
            expect(response).to have_http_status(:ok)
        end
        it('is correct template rendered') do
            expect(response).to render_template(:show)
        end
    end
end