class Public::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.build(post_comment_params)
    @post_comment.customer_id = current_customer.id
    @post_comment.post_id = @post.id
    if @post_comment.save
      flash[:success] = "コメントしました"
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :post_id, :customer_id, :event_id)
  end
end
