class Committee < ActiveRecord::Base
  has_many :committeemembers
  has_many :congresmen, through: :committeemembers
end
