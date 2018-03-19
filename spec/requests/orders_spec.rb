require 'rails_helper'

RSpec.describe 'Orders API', type: :request do
  let(:user) {create(:user)}
  let!(:orders) {create_list(:order, 10, created_by: user.id)}
  let(:order_id) {orders.first.id}
  let(:headers) {valid_headers}

  describe 'GET /orders' do
    before {get '/orders', params: {}, headers: headers}

    it 'returns orders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /orders/:id' do
    before {get "/orders/#{order_id}", params: {}, headers: headers}

    context 'when the records exists' do
      it 'returns the order' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(order_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:order_id) {100}

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Order/)
      end
    end
  end

  describe 'POST /orders' do
    # valid payload
    let(:valid_attributes) do
      {password: 12345, created_by: user.id.to_s }.to_json
    end
  
    context 'when the request is valid' do
      before { post '/orders', params: valid_attributes, headers: headers }
  
      it 'creates an order' do
        expect(json['password']).to eq(12345)
      end
  
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  
    context 'when the request is invalid' do
      let(:invalid_attributes) { { password: nil }.to_json }
      before { post '/orders', params: invalid_attributes, headers: headers }
  
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
  
      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank/)
      end
    end
  end
  
    # Test suite for PUT /orders/:id
  describe 'PUT /orders/:id' do
    let(:valid_attributes) { { password: 12345 }.to_json }
  
    context 'when the record exists' do
      before { put "/orders/#{order_id}", params: valid_attributes, headers: headers }
  
      it 'updates the record' do
        expect(response.body).to be_empty
      end
  
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  
    # Test suite for DELETE /orders/:id
  describe 'DELETE /orders/:id' do
    before { delete "/orders/#{order_id}", params: {}, headers: headers}
  
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end