class Admin::TicketOrderDetailsController < ApplicationController
  layout 'admin_header'
  before_action :authenticate_admin!

  def update
    @ticket_order_detail = TicketOrderDetail.find(params[:id])
    @ticketorder = @ticket_order_detail.ticket_order
    @ticket_order_details = @ticketorder.ticket_order_details
    @ticket_order_detail.update(ticket_order_detail_params)

    #注文ステータスを「チケット手配中」
    if @ticket_order_details.where(ticket_status: "チケット手配中").count >= 1
      @ticketorder.order_status = "発送準備中"
      @ticketorder.save
      flash[:notice] = "チケット手配ステータスが更新されました"
      redirect_to admin_ticket_order_path(@ticket_order_detail.ticket_order.id)
    end

    #注文個数とチケット手配完了になっている個数が同じならば
    if @ticketorder.ticket_order_details.count == @ticket_order_details.where(ticket_status: "チケット手配完了").count
      @ticketorder.order_status = "発送済み"
      @ticketorder.save
      flash[:notice] = "チケット手配ステータスが更新されました"
      redirect_to admin_ticket_order_path(@ticketorder.id)
    end
  end

  private

  def ticket_order_detail_params
    params.require(:ticket_order_detail).permit(:ticket_status)
  end
end
