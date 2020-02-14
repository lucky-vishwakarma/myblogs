class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

	def new
		if params[:comment_id].present?
			comment = Comment.find_by(id: params[:comment_id])
			@reply = comment.replies.new
		else
			reply = Reply.find_by(id: params[:reply_to])
			@reply = reply.nested_replys.new
		end
	end

	def create
		@comments = @post.comments
		@reply = current_user.replies.new(reply_params)
		@reply.save
	end

	private

    def reply_params
      params.require(:reply).permit(:boby, :comment_id, :reply_to)
    end

    def find_post
    	@post = Post.find_by(id: params[:post_id])
    end
end
