class Committee < ActiveRecord::Base
  has_many :committee_members
  has_many :congressmen, class_name: "Congressman", through: :committee_members

  def self.info_name(name)
    puts ""
    committee = Committee.find_by(name: name)
    puts "#{committee.abbreviation}"
    puts "Committee Chair: #{committee.chair}"
    puts "Committee Members:"
    members = CommitteeMember.select {|cm| cm.committee_id == committee.id}
    members.each do |m|
      puts Congressman.find(m.congressman_id).full_name
    end
    puts ""
  end

  def self.list
    puts ""
    self.all.each_with_index do |committee, index|
      puts "#{index + 1}. #{committee.abbreviation}  -  #{committee.name}"
    end
    puts ""
  end

  def self.info_initials(initials)
    puts ""
    committee = Committee.find_by(abbreviation: initials)
    puts "#{committee.name}"
    puts "Committee Chair: #{committee.chair}"
    puts "Committee Members:"
    members = CommitteeMember.select {|cm| cm.committee_id == committee.id}
    members.each do |m|
      puts Congressman.find(m.congressman_id).full_name
    end
    puts ""
  end

  def self.abbreviation_list
   self.all.map {|comm| comm.abbreviation}
  end

  def self.name_list
   self.all.map {|comm| comm.name}
  end

end
