class Admin::EventTicketsController < ApplicationController
  layout 'admin_header'
  before_action :authenticate_admin!

  def new
    @event_ticket = EventTicket.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_ticket = EventTicket.new(event_ticket_params)
     @event_ticket.event_id = @event.id
    if @event_ticket.save
      flash[:notice] = "イベントチケット情報が登録されました"
      redirect_to admin_event_path(@event)
    else
      render 'new'
    end
  end

  def index
    @event_tickets = EventTicket.page(params[:page]).per(10)
  end

  def show
    @event_ticket = EventTicket.find(params[:id])
  end

  def edit
    @event_ticket = EventTicket.find(params[:id])
  end

  def update
    @event_ticket = EventTicket.find(params[:id])
    if @event_ticket.update(event_ticket_params)
      flash[:notice] = "イベントチケット情報が更新されました"
      redirect_to admin_event_path(@event_ticket)
    else
      render 'edit'
    end
  end

  private

  def event_ticket_params
    params.require(:event_ticket).permit(:genre_id, :post_id, :event_id, :event_title, :ticket_startday, :ticket_endday, :ticket_place, :ticket_name, :ticket_introduction, :ticket_price, :sales_status, :performance_date )
  end
end
