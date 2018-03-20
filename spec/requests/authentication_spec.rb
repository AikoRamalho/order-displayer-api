require 'rails_helper'

RSpec.describe 'Authentication', type: :request do

  describe 'POST /auth/login' do
    #create user test
    let!(:user) { create(:user) }

    #set headers to auth
    let(:headers) {valid_headers.except('Authorization')}

    #set invalid and valid credentials
    let(:valid_credentials) do 
      {
        email: user.email,
        password: user.password
      }.to_json
    end

    let(:invalid_credentials) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    #set request.headers to our costum headers
    #before {allow(request).to recive(:headers).and_return(headers)}

    #return auth token when request is valid
    context 'When request is valid' do
      before {post '/auth/login', params: valid_credentials, headers: headers }

      it 'returns a authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'When the request is invalid' do
      before {post '/auth/login', params: invalid_credentials, headers: headers}

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end

