require 'rails_helper'

RSpec.describe 'Post', type: :request do
    describe 'GET /index' do
        it 'returns http success' do
            get user_posts_path(1)
            expect(response).to have_http_status(:success)
        end

        it 'should render index template' do
            get user_posts_path(1)
            expect(response).to render_template('index')
        end

        it 'should render correct text in template' do
            get user_posts_path(1)
            expect(response.body).to include('Post Index page')
        end
    end
end