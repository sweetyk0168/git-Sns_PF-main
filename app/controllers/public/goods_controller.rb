class Public::GoodsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @events = Event.all
    @event_goods = Good.where(event_id: params[:event_id])
    # @good = Good.find(params[:id])
    # @goods = Good.event.page(params[:page])
    # @goods = Good.page(params[:page])
    # @quantity = Good.count
  end

  def show
    @good = Good.find(params[:id])
  end

  def good_params
    params.require(:good).permit(:name, :introduction, :post_status, :image, :price, :event_id)
  end
end
