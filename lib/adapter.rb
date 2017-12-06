
class Congressman_Adapter

attr_reader :senate_response, :house_response, :senate_data, :house_data, :all_members

  def initialize
    senate_url = "https://api.propublica.org/congress/v1/115/senate/members.json"
    @senate_response = RestClient.get(senate_url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})
    house_url =
"https://api.propublica.org/congress/v1/115/house/members.json"
    @house_response = RestClient.get(house_url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})
  end

  def usable_data
      @senate_data = JSON.parse(self.senate_response)
      @house_data = JSON.parse(self.house_response)
      senate_members = @senate_data["results"][0]["members"]
      house_members = @house_data["results"][0]["members"]
      @all_members = []
      @all_members << senate_members
      @all_members << house_members
      @all_members.flatten
  end


end

class Committee_Adapter

attr_reader :senate_committee_response, :house_committee_response, :joint_committee_response, :all_committees, :senate_committees, :house_committees, :joint_committees, :ids

  def initialize
    senate_committee_url = "https://api.propublica.org/congress/v1/115/senate/committees.json"
    @senate_committee_response = RestClient.get(senate_committee_url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})

    house_committee_url = "https://api.propublica.org/congress/v1/115/house/committees.json"
    @house_committee_response = RestClient.get(house_committee_url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})

    joint_committee_url =
    "https://api.propublica.org/congress/v1/115/joint/committees.json"
        @joint_committee_response = RestClient.get(joint_committee_url, {"X-API-KEY" => ENV['CONGRESS_API_KEY']})
  end

  def usable_data
      @senate_committees = JSON.parse(self.senate_committee_response)
      @house_committees = JSON.parse(self.house_committee_response)
      @joint_committees = JSON.parse(self.joint_committee_response)
      senate_committee_list = @senate_committees["results"][0]["committees"]
      house_committee_list = @house_committees["results"][0]["committees"]
      joint_committee_list = @joint_committees["results"][0]["committees"]
      all_comms = []
      all_comms << senate_committee_list
      all_comms << house_committee_list
      all_comms << joint_committee_list
      @all_committees = all_comms.flatten
  end


end


test1 = Congressman_Adapter.new
test2 = test1.usable_data

test3 = Committee_Adapter.new
test4 = test3.usable_data
test5 = test4.map {|comm| comm["id"]}

# >>>>>>>>>>>>>>>>>>>>>>>>
senate_ids = test5[0..20]
house_ids = test5[21..41]
joint_ids = test5[42..46]


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

test10 = combine_committee_data(senate_ids,house_ids,joint_ids)

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


def put_into_datatable(array_of_hashes)
  array_of_hashes.each do |person|
    Congressman.create(first_name: person["first_name"], last_name: person["last_name"], party: person["party"], )
end
end
binding.pry

test9 = "Test"
