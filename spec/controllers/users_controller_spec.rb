require 'rails_helper'

RSpec.describe 'User', type: :request do
    describe 'GET /index' do
        it 'returns http success' do
            get users_path
            expect(response).to have_http_status(:success)
        end

        it 'should render index template' do
            get users_path
            expect(response).to render_template('index')
        end

        it 'should render correct text in template' do
            get users_path
            expect(response.body).to include('User Index page')
        end
    end
end
