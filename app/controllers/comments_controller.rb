class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/catalogs/#{comment.catalog.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, catalog_id: params[:catalog_id])
  end
end
