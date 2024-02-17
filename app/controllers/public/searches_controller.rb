class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    #選択したモデルに応じて検索を実行
    if @range == "Customer"
      @customers = Customer.looks(params[:search], params[:word])
      # @customers = Customer.where.not(id: current_customer.id)
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end