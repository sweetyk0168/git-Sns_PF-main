class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'

  def new
    @event = Event.new
  end

  def index
    @events = Event.page(params[:page])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "イベント情報が登録されました"
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @goods = @event.goods.page(params[:page])
    @event_tickets = @event.event_tickets.page(params[:page])
    @posts = @event.posts.page(params[:page])
    # @posts = Post.where(event_id: @event.id).page(params[:page])
    # @eventrepos = EventRepo.where(id: @posts.pluck(:event_repo_id)).page(params[:page])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "イベント情報が更新されました"
      redirect_to admin_event_path(@event)
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :name, :introduction, :post_status, :url_strings)
  end
end
