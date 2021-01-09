class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :root_to_path, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :image,
                                 :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def root_to_path
    @item = Item.find(params[:id])
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end
end
