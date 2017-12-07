require_relative '../config/environment'

#### State
def get_state_by_initials(state_initials)
  State.find_by(abbreviation: state_initials)
end


def members_by_state(state)
  state.congressmen
end

def party_counts_by_state(state)
  members_list = members_by_state(state)
  pcounts = members_list.group(:party_id).count
end

def party_summary_by_state(state)
  party_counts_by_state(state).each do |p, c|
    puts "#{Party.find(p).abbreviation}: #{c}"
  end
end

def up_for_next_elecction_by_state(state)
   members_list = members_by_state(state)
   up = members_list.select {|person| person[:next_election] == "2018"}
   up.each {|person| full_name(person)}
end

def full_name(congressman)
  puts "#{congressman.short_title} #{congressman.first_name} #{congressman.middle_name} #{congressman.last_name} (#{congressman.party.abbreviation})"
end
