
require 'pry'
# Getting committee abbreviations from api ids
committee_abbreviations = Committee_Adapter.new.usable_data.map {|comm| comm["id"]}
# Using committee abbreviations to find full committee info
senate_ids = committee_abbreviations[0..20]
house_ids = committee_abbreviations[21..41]
joint_ids = committee_abbreviations[42..46]


   def get_detailed_committee_info(array, chamber)
     answers = []
     array.each do |code|
       url =  "https://api.propublica.org/congress/v1/115/#{chamber}/committees/#{code}.json"
       response = RestClient.get(url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})
       data = JSON.parse(response)
       useable_data = data["results"]
       answers << useable_data
   end
   answers.flatten
 end

   def combine_committee_data(senate_ids,house_ids,joint_ids)
     all_comms = []
     all_comms << get_detailed_committee_info(senate_ids, "senate")
     all_comms << get_detailed_committee_info(house_ids, "house")
     all_comms << get_detailed_committee_info(joint_ids, "joint")
     all_comms.flatten
   end



# Array of hashes for individual committees
committees = combine_committee_data(senate_ids,house_ids,joint_ids)
# Array of hashes for individual congressmen
congressmen = Congressman_Adapter.new.usable_data

def put_congressmen_into_datatable(array_of_hashes)
  array_of_hashes.each do |person|
    congressman = Congressman.create(
       short_title: person["short_title"],
       first_name: person["first_name"],
       middle_name: person["middle_name"],
       last_name: person["last_name"],
       api_uri: person["api_uri"],
       api_id: person["id"],
       party_name: person["party"],
       # party_id: person["party_id"],
       leadership_role: person["leadership_role"],
       twitter_account: person["twitter_account"],
       facebook_account: person["facebook_account"],
       youtube_account: person["youtube_account"],
       url: person["url"],
       contact_form: person["contact_form"],
       in_office: person["in_office"],
       next_election: person["next_election"],
       total_votes: person["total_votes"],
       missed_votes: person["missed_votes"],
       office_address: person["office_address"],
       phone: person["phone"],
       fax: person["fax"],
       state_name: person["state"],
       # state_id: person["state_id"],
       state_rank: person["state_rank"],
       votes_with_party_pct: person["votes_with_party_pct"]
    )

    #look at person's party, if a party exists where   party.abbreviation == congressman.party_name add that party.id to the congressmans party_id
    congressman.party_name
    party = Party.find_or_create_by(abbreviation: congressman.party_name)
    congressman.party_id = party.id
    congressman.save


    congressman.state_name
    state = State.find_or_create_by(abbreviation: congressman.state_name)
    congressman.state_id = state.id
    congressman.save

    #
    # person.each do |key, value|
    #   if (Congressman.method_defined? key) && (key != "party" && key != "state")
    #     congressman.send((update),((self.id), value))
    #   end
    # end
  end
end

def put_committees_into_datatable(array_of_hashes)
  array_of_hashes.each do |committee|
    Committee.create(
      name: committee["name"],
      chamber: committee["chamber"],
      abbreviation: committee["id"],
      url: committee["url"],
      chair: committee["chair"],
      chair_id: committee["chair_id"],
      ranking_member_id: committee["ranking_member_id"]
    )

  end
end

def put_congressmen_into_committee_members(array_of_hashes)
  array_of_hashes.each do |committee|
    committee["current_members"].each do |member|
      CommitteeMember.create(
         congressman_id: Congressman.find_by(api_id: member["id"]).id,
         committee_id: Committee.find_by(abbreviation: committee["id"]).id
      )
    end
  end
end
# tester = committees.map do |committee| committee["name"] end
  # binding.pry
# Seed DB with congressmen
put_congressmen_into_datatable(congressmen)
put_committees_into_datatable(committees)
put_congressmen_into_committee_members(committees)
