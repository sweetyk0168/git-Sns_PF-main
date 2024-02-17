class Admin::TicketOrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def index
    @ticketorders = TicketOrder.all.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @ticketorder = TicketOrder.find(params[:id])
    @ticket_order_details = @ticketorder.ticket_order_details
  end

  def update
    @ticketorder = TicketOrder.find(params[:id])
    @ticketorder.update(ticket_order_params)
    @ticket_order_details = @ticketorder.ticket_order_details

    if @ticketorder.order_status == "入金確認"
        @ticket_order_details.each do |ticket_order_detail|
        ticket_order_detail.ticket_status = "チケット手配中"
        ticket_order_detail.save
        flash[:notice] = "チケット手配ステータスが更新されました"
      end
    end
    redirect_to admin_ticket_order_path(@ticketorder.id)
  end

  private

  def ticket_order_params
    params.require(:ticket_order).permit(:customer_id, :postcode, :address, :name, :postage, :payment, :payment_method, :order_status)
  end
end
