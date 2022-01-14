class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user.id && @item.order.nil?
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :transport_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:id])
  end
end
