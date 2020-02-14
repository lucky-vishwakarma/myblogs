class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  has_many :posts
  has_many :comments
  has_many :replies, class_name: "Reply"

  # Validation
	validates :name, presence: true
end
