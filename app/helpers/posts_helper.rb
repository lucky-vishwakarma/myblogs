module PostsHelper
	def date_format(date)
		date.strftime("%B %d, %Y at %I:%M %p")
	end

	def page_title post
		post.persisted? ? "Edit Blog" : "New Blog"
	end
end
