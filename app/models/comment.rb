class Comment < ActiveRecord::Base
 
    belongs_to :user
    belongs_to :post

    has_reputation :likes, source: :user, aggregated_by: :sum
    validates :title, presence: true


end
