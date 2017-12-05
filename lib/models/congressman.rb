class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
end
