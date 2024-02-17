class Admin::GoodsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @good = Good.new
  end

  def create
    @event = Event.find(params[:event_id])
    @good = Good.new(good_params)
    @good.event_id = @event.id
    if @good.save
      flash[:notice] = "グッズ情報が登録されました"
        # byebug
      redirect_to admin_event_path(@event)
    else
      render 'new'
    end
  end

  def index
    @goods = Good.page(params[:page])
  end

  def show
    # @event = Event.find(params[:event_id])
    @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])
    if @good.update(good_params)
      flash[:notice] = "グッズ情報が更新されました"
      redirect_to admin_event_good_path(@good)
    else
      render 'edit'
    end
  end

  private

  def good_params
    params.require(:good).permit(:name, :introduction, :post_status, :image, :price)
  end
end
