class Reply < ApplicationRecord
	# Associations
	belongs_to :comment, optional: :true
	belongs_to :user
	has_many :nested_replys, class_name: "Reply", foreign_key: :reply_to

	# Validation
	validates :boby, presence: true

end
