require_relative '../config/environment'

#### State
def members_by_state(state_initials)
  State.find_by(abbreviation: state_initials).congressmen
end

def party_counts_by_state(state_initials)
  members_list = members_by_state(state_initials)
  pcounts = members_list.group(:party_id).count
end

def party_summary_by_state(state_initials)
  pcounts.each {|p, c| puts "#{Party.find(p).abbreviation}: #{c}"}
end

def up_for_next_elecction_by_state(state_initials)
   members_list = members_by_state(state_initials)
   up = members_list.select {|person| person[:next_election] == "2018"}
   up.each {|person| full_name(person)}
end

def full_name(congressman)
  puts "#{congressman.short_title} #{congressman.first_name} #{congressman.middle_name} #{congressman.last_name} (#{congressman.party.abbreviation})"
end
