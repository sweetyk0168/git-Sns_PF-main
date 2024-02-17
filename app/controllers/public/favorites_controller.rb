class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.new(post_id: @post.id)
    @favorite.save
    flash[:notice] = "閲覧していた投稿にいいねしました"
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_customer.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    flash[:notice] = "閲覧していた投稿にいいねを取り消しました"
    redirect_to posts_path
  end
end
