class Committee < ActiveRecord::Base
  has_many :committee_members
  has_many :congressmen, class_name: "Congressman", through: :committee_members
end
