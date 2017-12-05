class Party < ActiveRecord::Base
  has_many :congressmen, :class_name => "Congressman"
end
