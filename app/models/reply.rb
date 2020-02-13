class Reply < ApplicationRecord
	belongs_to :comment, optional: :true
	belongs_to :user
	has_many :nested_replys, class_name: "Reply", foreign_key: :reply_to

	def new_reply?
		true
	end
end
