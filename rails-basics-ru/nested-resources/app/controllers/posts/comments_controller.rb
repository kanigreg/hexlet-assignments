# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  def edit
    resource_post
    @comment = PostComment.find params[:id]
  end

  def create
    @post = resource_post
    @comment = @resource_post.comments.build(comments_params)

    if @comment.save
      redirect_to @resource_post, notice: 'Comment was successfully created'
    else
      render 'posts/show'
    end
  end

  def update
    resource_post
    @comment = PostComment.find params[:id]

    if @comment.update(comments_params)
      redirect_to @resource_post, notice: 'Comment was successfully updated'
    else
      render :edit, status: :unprocessible_entity
    end
  end

  def destroy
    resource_post
    @comment = PostComment.find params[:id]

    @comment.destroy

    redirect_to @resource_post
  end

  private

  def comments_params
    params.require(:post_comment).permit(:body)
  end
end
