# frozen_string_literal: true

class PostsController < ApplicationController
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all

    authorize Post
  end

  def show
    @post = Post.find(params[:id])

    authorize @post
  end

  def new
    @post = Post.new

    authorize @post
  end

  def create
    authorize Post

    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])

    authorize @post
  end

  def update
    @post = Post.find(params[:id])

    authorize @post

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    authorize @post

    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(%i[title body])
  end
  # END
end
