class GroupComment < ActiveRecord::Base
  belongs_to :group
  belongs_to :group_post
end
