class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.create(user_id:current_user.id,item_id:params[:item_id])
    @shipping = Shipping.create(shipping_params)
  end

  private

  def shipping_params
    params.permit(:post_code,:prefecture_id,:municipalities,:address,:building_name,:phone_number).merge(order_id: @order.id)
  end
end
