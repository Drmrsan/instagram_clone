class Post < ApplicationRecord
	acts_as_votable
	belongs_to :user
	has_many :comments, dependent: :destroy
	mount_uploader :image, ImageUploader

	# validations
	validates :image, presence: true
end
