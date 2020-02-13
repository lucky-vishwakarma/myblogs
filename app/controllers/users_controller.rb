class UsersController < ApplicationController
	before_action :authenticate_user!

	def myblogs
		@posts = current_user.posts
	end
end