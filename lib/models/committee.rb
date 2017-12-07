class Committee < ActiveRecord::Base
  has_many :committee_members
  has_many :congressmen, class_name: "Congressman", through: :committee_members

  def self.info_name(name)
    committee = Committee.find_by(name: name)
    puts "#{committee.abbreviation}"
    puts "Committee Chair: #{committee.chair}"
    puts "Committee Members:"
    members = CommitteeMember.select {|cm| cm.committee_id == committee.id}
    members.each do |m|
      Congressman.find(m.congressman_id).full_name
    end
  end

  def self.list
    self.all.each_with_index do |committee, index|
      puts "#{index + 1}. #{committee.abbreviation}  -  #{committee.name}"
    end
  end

  def self.info_initials(initials)
    committee = Committee.find_by(abbreviation: initials)
    puts "#{committee.name}"
    puts "Committee Chair: #{committee.chair}"
    puts "Committee Members:"
    members = CommitteeMember.select {|cm| cm.committee_id == committee.id}
    members.each do |m|
      Congressman.find(m.congressman_id).full_name
    end
  end
end
