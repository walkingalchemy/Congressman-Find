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

def congressman_lookup(full_name_input)
  name_array = full_name_input.split
  f_name = name_array[0]
  l_name = name_array[-1]
  Congressman.find_by(first_name: f_name && last_name: l_name)
end


def congressman_basic_info(full_name_input)
  selected = congressman_lookup(full_name_input)
  output = <<-OUTPUT
      Basic Information
     #{selected.short_title}
     #{selected.first_name}
     #{selected.middle_name}
     #{selected.last_name}
     #{Party_find(selected.party_id).abbreviation}
     #{selected.next_election}

      Contact Information and Social Media
     #{selected.office_address}
     #{selected.phone}
     #{selected.fax}
     #{selected.twitter_account}
     #{selcted.facebook_account}
     #{selected.youtube_account}
     #{selected.url}
     #{selected.contact_form}
  OUTPUT
   puts output
end


def congressman_committees()
  selected = congressman_lookup(full_name_input)
  selected_comms = selected.committees
  selected_comms.each do |committee|
    puts "#{committee.name}"
  end
end
