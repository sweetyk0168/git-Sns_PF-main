class Public::CartTicketsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_tickets = current_customer.cart_tickets
    @total = 0
  end

  def create
    @event = EventTicket.find(params[:cart_ticket][:event_ticket_id]).event
    #カート内に同一チケットがあるか？
    @in_cart_ticket = current_customer.cart_tickets.find_by(event_ticket_id: params[:cart_ticket][:event_ticket_id])
    if @in_cart_ticket
       @sum_amount = @in_cart_ticket.amount + params[:cart_ticket][:amount].to_i
       @in_cart_ticket.update(amount: @sum_amount)
       redirect_to cart_tickets_path
    else
      #新しいカートの作成
      @cart_ticket = CartTicket.new(cart_ticket_params)
      #誰のカートか紐づけ
      @cart_ticket.customer_id = current_customer.id
      #情報を保存できるか？
      @cart_ticket.save!
      #カートページ遷移
      flash[:notice] = "チケットをカートに追加しました。"
      redirect_to cart_tickets_path
    end
  end

 def update
    @cart_tickets = CartTicket.find(params[:id])
    if @cart_tickets.update(cart_ticket_params)
       flash[:notice] = "個数を変更しました。"
       redirect_to cart_tickets_path
    else
       flash[:notice] = "個数の変更に失敗しました。"
       render 'index'
    end
 end

  def destroy
    @cart_tickets = CartTicket.find(params[:id])
    if @cart_tickets.destroy
      flash[:notice] = "チケットの削除が完了しました。"
      redirect_to cart_tickets_path
    else
      flash[:notice] = "チケットの削除が出来ませんでした。"
      render 'index'
    end
  end

  def destroy_all
    customer = Customer.find(current_customer.id)
    if customer.cart_tickets.destroy_all
      flash[:notice] = "カート内のチケットを全て削除しました。"
      redirect_to cart_tickets_path
    else
      flash[:notice] = "カート内のチケットを削除出来ませんでした。"
      render 'index'
    end
  end

  private

  def cart_ticket_params
    params.require(:cart_ticket).permit(:amount, :event_ticket_id, :customer_id)
  end
end
