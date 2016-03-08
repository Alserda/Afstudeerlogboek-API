class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    post = Post.new
    post.date = post_params[:date]
    post.body = post_params[:body]
    post.author = Author.where(title: post_params[:author]).first

    if post.save
      render json: post, status: :created, location: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :author, :body)
  end
end
