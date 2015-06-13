class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    # formから投げられたデータを受け取る
    @item = Item.new(item_params)
    # これを保存する
    @item.save
    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # formから投げられたデータを受け取る
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)

    # show.html.erbに飛ばす
    redirect_to "/items/#{@item.id}"
  end

  private
  def item_params
    # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :seller_id,
      :email,
      :image_url
    )
  end
end
