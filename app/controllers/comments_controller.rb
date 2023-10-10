class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path, notice: "コメントを投稿しました！")
    else
      flash[:alert] = "コメントが投稿できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path, notice: "コメントを削除しました")
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :product_id, :content)
  end
end
