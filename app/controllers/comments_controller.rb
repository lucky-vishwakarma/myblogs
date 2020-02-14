class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.new(post_params)
    @comment.user_id = current_user.id

      if @comment.save
        redirect_to @post, notice: 'comment was successfully created.'
      else
        render :new 
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:comment).permit(:boby)
    end
end