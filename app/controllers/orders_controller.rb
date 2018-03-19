class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  #GET /Orders
  def index
    @orders = current_user.orders
    json_response(@orders)
  end

  #POST /Orders
  def create
    @order = current_user.orders.create!(order_params)
    json_response(@order, :created)
  end

  def show
    json_response(@order)
  end

  def update
    @order.update(order_params)
    head :no_content
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(:password)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
