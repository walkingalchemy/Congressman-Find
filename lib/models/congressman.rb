class Congressman < ActiveRecord::Base
  belongs_to :state
  belongs_to :party
  has_many :committee_members
  has_many :committees, through: :committee_members

  def full_name
    print "#{self.short_title} #{self.first_name} #{self.middle_name} #{self.last_name} (#{self.party.abbreviation})"
  end

  def self.lookup(full_name_input)
    name_array = full_name_input.split
    f_name = name_array[0]
    l_name = name_array[-1]
    Congressman.find_by(first_name: f_name, last_name: l_name)
  end

  def basic_info
    output =
     <<-OUTPUT
       Basic Information
       #{self.short_title} #{self.first_name} #{self.middle_name} #{self.last_name}
       (#{self.party_name})
       Next election: #{self.next_election}

       Contact Information and Social Media
       Office : #{self.office_address}
       Phone : #{self.phone}
       Fax : #{self.fax}
       Twitter : #{self.twitter_account}
       Facebook : #{self.facebook_account}
       Youtube : #{self.youtube_account}
       Website : #{self.url}
       Email Link : #{self.contact_form}
                    (Copy into browser)
     OUTPUT
    puts output
  end

  def find_committees
    self.committees.each_with_index do |committee, index|
      puts "#{committee.abbreviation}  -  #{committee.name}"
    end
  end



end
