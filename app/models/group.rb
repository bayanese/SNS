class Group < ActiveRecord::Base

	has_many :users
	has_many :group_posts
	has_many :group_comments
end
