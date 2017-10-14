class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path, notice: "メッセージの作成に成功しました。"
    else
      redirect_to root_path, alert: "メッセージを入力してください"
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
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
