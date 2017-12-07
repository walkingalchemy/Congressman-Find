class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  has_many :committee_members
  has_many :committees, through: :committee_members

  def full_name
    puts "#{self.short_title} #{self.first_name} #{self.middle_name} #{self.last_name} (#{self.party.abbreviation})"
  end






end
