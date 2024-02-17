class Public::HomesController < ApplicationController
  before_action :authenticate_customer!

  def top
    @posts = Post.order(id: "DESC").limit(4)
    @post_comment = PostComment.new
  end
end
