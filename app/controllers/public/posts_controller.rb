class Public::PostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id

    if post_params[:event_id].blank?
      @post.event_id = nil  # もしくは適切なデフォルト値
    else
      @post.event_id = post_params[:event_id]
    end

    if post_params[:event_questionnaires_question_id].blank?
       @post.event_questionnaires_question_id = nil  # もしくは適切なデフォルト値
    else
       @post.event_questionnaires_question_id = post_params[:event_questionnaires_question_id]
    end


    if @post.body.blank?
      @post.body = ""  # 空文字列を設定
    end

    if @post.save
      flash[:notice] = "新規投稿されました"
        # byebug
      # PostEventRepo.create(post_id: @post.id, event_repo_id: params[:post][:event_repo_ids])
      redirect_to posts_path
    else
      # if @post.errors.include?(:event_id)
      #   flash[:error] = 'イベントを選択してください。'
      # end
      logger.error "Post 保存エラー: #{@post.errors.full_messages.join(', ')}"
      render 'new'
    end
  end

  def index
    # @posts = Post.page(params[:page])
    @posts = Post.order(id: "DESC").page(params[:page])
    @customer = current_customer
    @post_comments = PostComment.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments
    @post_comment = @post.post_comments.build
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :customer_id, :introduction, :image, :post_comment, :event_id, :good_id, :event_questionnaires_question_id)
  end

  def correct_customer
    @post = Post.find(params[:id])
    @customer = @post.customer
    redirect_to(posts_path) unless @customer == current_customer
  end
end
