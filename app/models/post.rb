class Post < ActiveRecord::Base

	# Lets our application know about the existing relationship between posts and users
	belongs_to :user

	# Makes sure that both post's title and body are present and have at least 3 and 30 characters respectively
	validates :title, presence: true, length: { minimum: 3 }
    validates :body, presence: true, length: { minimum: 30 }
end
