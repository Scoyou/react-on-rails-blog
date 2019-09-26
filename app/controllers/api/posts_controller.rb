class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      json: { errors: @post.errors }, status: :unprocessable_entry
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: @post
    else
      json: { errors: @post.errors }, status: :unprocessable_entry
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    render json: { message: 'post deleted' }
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
