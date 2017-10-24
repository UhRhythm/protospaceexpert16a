class CommentsController < ApplicationController
  before_filter :check_logined, except: [:create]
  before_action :check_logined, only: [:create]


  def new
    @comment = Comment.new
  end

  def create
    @comments = Comment.create(comment_params)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @prototype = @comment.prototype
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path, notice: "成功"
    else
      redirect_to root_path, notice: "失敗"
   end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

  def check_logined
    if current_user then
      begin
        @user = current_user.id
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end

    unless current_user
      # flash[:referer] = request.fullpath
      redirect_to new_user_session_path

    end
  end

end

