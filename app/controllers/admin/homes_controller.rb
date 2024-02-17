class Admin::HomesController < ApplicationController
  layout 'admin_header'
  before_action :authenticate_admin!

  def top
    @events = Event.order(id: "DESC").limit(4)
  end
end
