require_relative 'printful'

class PostsController < ApplicationController
  

  def index
    @posts = Post.all.order(created_at: :desc)
    @printful = Printful.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:title, :description, :public, :image, :two_to_three, :four_to_five, :three_to_four, :one_to_one)
  end

  def authorize
    if @post.user != current_user
      redirect_to @post
    end
  end
end
