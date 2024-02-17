class Admin::PostsController < ApplicationController
  def destroy
    @post = Post.find(params[:id])
    @event = @post.event
    @post.destroy
    flash[:notice] = "イベントレポート情報が削除されました"
    redirect_to admin_event_path(@event)
  end
end
