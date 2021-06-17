class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(params.permit(:article_id, :body))
    if comment.persisted?
      render json: { message: 'Your comment has been successfully created' }, status: 201
    else
      render json: { error_message: 'Your comment was not created' }, status: 422
    end
  end
end
