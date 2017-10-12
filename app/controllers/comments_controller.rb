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
    v
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
