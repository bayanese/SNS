class GroupPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  has_many :group_post_comments
  has_many :group_comments

  has_reputation :likes, source: :user, aggregated_by: :sum
  validates :title, presence: true
end
