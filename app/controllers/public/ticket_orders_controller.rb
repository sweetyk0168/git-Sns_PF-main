class Public::TicketOrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :confirm, :create, :index, :show, :complete]

  def new
    @ticketorder = TicketOrder.new
  end

  def confirm
    @cart_tickets = current_customer.cart_tickets

    @ticketorder = TicketOrder.new(
      payment_method:params[:ticket_order][:payment_method])
      @ticketorder.postage = 800

      if params[:ticket_order][:my_address] == "1"
        @ticketorder.postcode = current_customer.postal_code
        @ticketorder.address = current_customer.address
        @ticketorder.name = current_customer.last_name + current_customer.first_name
      elsif params[:ticket_order][:my_address] == "2"
        @ticketorder.postcode = params[:ticket_order][:postal_code]
        @ticketorder.address = params[:ticker_order][:address]
        @ticketorder.name = params[:ticket_order][:name]
      else
        flash[:notice] = "配送先が選択されていません"
        render 'new'
      end
  end

  def complete
  end

  def create
    @ticketorder = current_customer.ticket_orders.new(ticket_order_params)
    @ticketorder.customer_id = current_customer.id
    @ticketorder.save

    #カートを空にするため、ticket_order_detailに保存する
    #カート内チケットを１つずつ取り出しループ
    current_customer.cart_tickets.each do |cart_ticket|
      #初期化宣言
      @ticket_order_detail = TicketOrderDetail.new
      #チケット注文idを紐づけておく
      @ticket_order_detail.ticket_order_id = @ticketorder.id
      #カート内チケットidを注文チケットidに代入
      @ticket_order_detail.event_ticket_id = cart_ticket.event_ticket_id
      #カート内チケットの枚数を注文チケットの枚数を代入
      @ticket_order_detail.amount = cart_ticket.amount
      #消費税込に計算して代入
      @ticket_order_detail.price = ((cart_ticket.event_ticket.add_tax_ticket_price*cart_ticket.amount)*1.1).to_i
      #注文チケットを保存
      @ticket_order_detail.save
    end
    current_customer.cart_tickets.destroy_all
    redirect_to complete_ticket_orders_path
  end

  def index
    @ticketorders = current_customer.ticketorders.all.page(params[:page]).per(6).order('created_at DESC')
  end

  def show
    @ticketorder = TicketOrder.find(params[:id])
    @ticket_order_details = @ticketorder.ticket_order_details.all
  end

  private

  def ticket_order_params
    params.require(:ticket_order).permit(:postcode, :address, :name, :postage, :payment, :payment_method, :price, :event_ticket_id)
  end
end
