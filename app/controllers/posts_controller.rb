class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
  end

  def create
    @post = current_user.posts.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Fetch post by id
    def set_post
      @post = Post.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
