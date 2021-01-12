class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]
  before_action :root_to_path, only: :index
  

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def root_to_path
    if @item.order != nil || current_user.id == @item.user.id 
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
