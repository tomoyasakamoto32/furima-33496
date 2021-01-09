class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find_params, only: [:show, :edit, :update, :destroy]
  before_action :root_to_path, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :image,
                                 :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def root_to_path
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def item_find_params
    @item = Item.find(params[:id])
  end
end
