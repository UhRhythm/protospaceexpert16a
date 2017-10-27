class CommentsController < ApplicationController
  before_action :check_logined, only: [:create]
  def new
    @comment = Comment.new
  end

  def create
    if current_user
      @comments = Comment.create(comment_params)
      respond_to do |format|
        if current_user
          format.html{redirect_to root_path}
          format.json{redirect_to root_path}
        else
          format.html{redirect_to root_path}
          format.json{redirect_to root_path}
        end
      end
    else
      redirect_to root_path
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

