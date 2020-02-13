class Post < ApplicationRecord
	# Associations
	has_many :comments
	belongs_to :user

	# Validation
	validates :title, :description,  presence: true

	mount_uploader :image, PictureUploader

	def is_eligible_user current_user
		user_id == current_user.id
	end
end
