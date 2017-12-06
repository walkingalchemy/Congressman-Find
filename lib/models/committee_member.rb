class CommitteeMember < ActiveRecord::Base
  belongs_to :congressman
  belongs_to :committee
end
