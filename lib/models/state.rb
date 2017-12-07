class State < ActiveRecord::Base
  has_many :congressmen, :class_name => "Congressman"


  def self.get_by_initials(state_initials)
    self.find_by(abbreviation: state_initials)
  end

 def get_congressmen
  puts self.abbreviation
      self.congressmen.each {|c| puts c.full_name}
end


  def party_counts
    members_list = self.congressmen
    pcounts = members_list.group(:party_id).count
  end

  def party_summary
    self.party_counts.each do |p, c|
      puts "#{Party.find(p).abbreviation}: #{c}"
    end
  end

  def up_for_next_election
     members_list = self.congressmen
     up = members_list.select {|congressman| congressman[:next_election] == "2018"}
     up.each {|congressman| congressman.full_name}
  end
end
