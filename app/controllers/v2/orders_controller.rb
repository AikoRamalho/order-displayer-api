class V2::OrdersController < ApplicationController
  def index
    json_response({message: 'Hello there'})
end
