class User < ApplicationRecord
	acts_as_voter
	
	extend FriendlyId
  friendly_id :username, use: :slugged

	has_many :posts, dependent: :destroy
	has_many :comments
	mount_uploader :avatar, AvatarUploader

	validates :username, presence:true,
											 length: { minimum: 4, maximum: 15 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
