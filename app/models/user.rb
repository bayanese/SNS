class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 has_many :posts
 belongs_to :group
 has_many :comments
 has_many :likes
 has_many :like_posts, through: :likes, source: :post
 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
 has_many :followings, through: :following_relationships
 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
 has_many :followers, through: :follower_relationships
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 def like?(post)
     likes.find_by(post_id: post.id)
 end

 def like!(post)
     likes.create!(post_id: post.id)
 end

 def dislike!(post)
     likes.find_by(post_id: post.id).destroy
 end

 def following?(other_user)
     following_relationships.find_by(following_id: other_user.id)
 end

 def follow!(other_user)
     following_relationships.create!(following_id: other_user.id)
 end

 def unfollow!(other_user)
     following_relationships.find_by(following_id: other_user.id).destroy
 end

end
  

