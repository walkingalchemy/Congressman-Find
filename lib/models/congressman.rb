class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  has_many :committee_members
  has_many :committees, through: :committee_members

  def full_name
    puts "#{self.short_title} #{self.first_name} #{self.middle_name} #{self.last_name} (#{self.party.abbreviation})"
  end

  def self.lookup(full_name_input)
    name_array = full_name_input.split
    f_name = name_array[0]
    l_name = name_array[-1]
    Congressman.find_by(first_name: f_name, last_name: l_name)
  end

  def self.basic_info(full_name_input)
    selected = self.lookup(full_name_input)
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

  def self.committees(full_name_input)
    selected = self.lookup(full_name_input)
    selected_comms = selected.committees
    selected_comms.each_with_index do |committee, index|
      puts "#{index + 1}. #{committee.abbreviation}  -  #{committee.name}"
    end
  end



end
