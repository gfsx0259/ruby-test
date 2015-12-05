class CartController < ApplicationController

  def add
    params[:qty] = 1 if !params.key?(:qty)
    args = {cart_id: @cart.id, item_id: params[:id]}
    if Position.exists?(args)
      @item = Position.where(args).first
      @item.increment :quantity, params[:qty].to_i
      @item.save
    else
      Position.create( cart_id: @cart.id, item_id: params[:id],quantity:params[:qty].to_i)
    end
  redirect_to :back
  end

  def remove
   if params.key?(:id)
     Position.find_by_id(params[:id]).destroy
   end
   redirect_to :back
  end
end
