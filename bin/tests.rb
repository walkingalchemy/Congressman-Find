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
  Congressman.find_by(first_name: f_name, last_name: l_name)
end


def congressman_basic_info(full_name_input)
  selected = congressman_lookup(full_name_input)
  selected_id = Party.find(selected.party_id).abbreviation
  output =
   <<-OUTPUT
     Basic Information
     #{selected.short_title} #{selected.first_name} #{selected.middle_name} #{selected.last_name}
     (#{selected_id})
     Next election: #{selected.next_election}

     Contact Information and Social Media
     Office : #{selected.office_address}
     Phone : #{selected.phone}
     Fax : #{selected.fax}
     Twitter : #{selected.twitter_account}
     Facebook : #{selected.facebook_account}
     Youtube : #{selected.youtube_account}
     Website : #{selected.url}
     Email Link : #{selected.contact_form}
                  (Copy into browser)
   OUTPUT
  puts output
end


def congressman_committees(full_name_input)
  selected = congressman_lookup(full_name_input)
  selected_comms = selected.committees
  selected_comms.each_with_index do |committee, index|
    puts "#{index + 1}. #{committee.abbreviation}  -  #{committee.name}"
  end
end

def committee_info(initials)
  committee = Committee.find_by(abbreviation: initials)
  puts "#{committee.name}"
  puts "Committee Chair: #{committee.chair}"
  puts "Committee Members:"
  members = CommitteeMember.select {|cm| cm.committee_id == committee.id}
  members.each do |m|
    Congressman.find(m.id).full_name
  end
end
