class Post < ApplicationRecord
	# Associations
	has_many :comments
	belongs_to :user

	# Validation
	validates :title, :description, :image, presence: true

	mount_uploader :image, PictureUploader
	acts_as_votable

	# delegates
	delegate :name, to: :user

	# Instanse Methods
	def is_eligible_user current_user
		user_id == current_user.id
	end
end
