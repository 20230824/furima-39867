class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :today_id, :image).merge(user_id: current_user.id)
  end
end
