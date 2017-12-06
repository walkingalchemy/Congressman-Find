class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  has_many :committee_members
  has_many :committees, through: :committee_members
end
