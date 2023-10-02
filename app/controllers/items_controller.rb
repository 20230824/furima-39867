class ItemsController < ApplicationController

  def new
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :today_id).merge(user_id: current_user.id)
  end
end
