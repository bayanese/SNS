class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  has_reputation :likes, source: :user, aggregated_by: :sum
  validates :title, presence: true
end
