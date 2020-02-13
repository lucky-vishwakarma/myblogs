module PostsHelper
	def date_format(date)
		date.strftime("%B %d, %Y at %I:%M %p")
	end
end
