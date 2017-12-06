class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  has_many :committeemembers
  has_many :committees, through: :committeemembers
end
