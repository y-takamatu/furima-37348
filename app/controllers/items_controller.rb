class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
      render :new
    else 
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:delivery_charge_id,:prefecture_id,:transport_day_id,:price,:image).merge(user_id: current_user.id)
  end
end