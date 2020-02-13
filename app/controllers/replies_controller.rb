class RepliesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_post, only: [:new, :create]

	def new
		if params[:comment_id].present?
			@comment = Comment.find_by(id: params[:comment_id])
			@reply = @comment.replies.new
		else
			reply = Reply.find_by(id: params[:reply_to])
			@reply = reply.nested_replys.new
		end
	end

	def create
		@reply = Reply.new(reply_params)
		@reply.user_id = current_user.id
		if @reply.save
			redirect_to @post
		end

	end

	private

    def reply_params
      params.require(:reply).permit(:boby, :comment_id, :reply_to)
    end

    def find_post
    	@post = Post.find_by(id: params[:post_id])
    end
end
