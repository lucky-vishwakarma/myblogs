class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update]
  before_action :set_post, only: [:create, :show, :edit, :update, :destroy, :new_reply]

  # def index
  #   @Comments = Post.all
  # end

  # def show
  # end


  # def new
  #   @post = Post.new
  # end


  # def edit
  # end


  def create
    @comment = @post.comments.new(post_params)
    @comment.user_id = current_user.id

      if @comment.save
        redirect_to @post, notice: 'comment was successfully created.'
      else
        render :new 
      end
  end

  # def new_reply
  #   binding.pry
  #   @comment = @post.comments.find_by(id: params[:id])
  #   @reply = @comment.replies.new
  #   # if params[:comment_id].present?
  #   #   @comment = Comment.find_by(id: params[:comment_id])
  #   #   @reply = @comment.replies.new
  #   # # else
  #   # #   @rep = Reply.find_by(id: params[:reply_to])
  #   # #   @reply = Reply.new(reply_to: @rep.id)
  #   # end
  # end


  # def create_reply
  #   @reply = Comment.new(reply_params)
  #   @reply.user_id = current_user.id
  #   @reply.post_id = @reply.comment.post.id

  #   if @reply.save
  #     redirect_to @reply.comment.post
  #   end

  # end

  # # PATCH/PUT /Comments/1
  # # PATCH/PUT /Comments/1.json
  # def update
  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /Comments/1
  # # DELETE /Comments/1.json
  # def destroy
  #   @post.destroy
  #   redirect_to Comments_url, notice: 'Post was successfully destroyed.'
  # end

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
