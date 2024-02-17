class Public::EventTicketsController < ApplicationController
  def index
    @events = Event.all
    @event_tickets = Event.find(params[:event_id]).event_tickets.page(params[:page]).per(10)
    # @event_tickets = EventTicket.page(params[:page]).per(10)
    # @event_event_tickets = EventTicket.where(event_id: params[:event_id])
  end

  def show
    @event_ticket = EventTicket.find(params[:id])
    @cart_ticket = CartTicket.new
  end

  private

  def event_ticket_params
    params.require(:event_ticket).permit(:ticket_name, :introduction, :price, :sales_status, :image)
  end
end