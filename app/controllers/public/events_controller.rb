class Public::EventsController < ApplicationController
  before_action :authenticate_customer!

  def index
    # @event = Event.find(params[:id])
    @events = Event.page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @goods = @event.goods.page(params[:page])
        # @goods = @event.goods.find(params[:id])
    @event_tickets = @event.event_tickets.page(params[:page])
  end

  def event_params
    params.require(:event).permit(:genre_id, :name, :introduction, :post_status, :url_strings, :customer_id)
  end
end
