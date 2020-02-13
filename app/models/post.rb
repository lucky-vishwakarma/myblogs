class Post < ApplicationRecord
	has_many :comments
	belongs_to :user

	validates :title, :description,  presence: true
end
