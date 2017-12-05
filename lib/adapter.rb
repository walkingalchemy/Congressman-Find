class Adapter

class Congressman_Adapter

attr_reader :senate_response, :house_response, :senate_data, :house_data, :all_members

  def initialize
    senate_url = "https://api.propublica.org/congress/v1/115/senate/members.json"
    @senate_response = RestClient.get(senate_url, {"X-API-KEY" => "2QhdrNtphd4PySwo0wofHyi6udSfrLvLe1nhhl3H"})
    house_url =
"https://api.propublica.org/congress/v1/115/house/members.json"
    @house_response = RestClient.get(house_url, {"X-API-KEY" => "2QhdrNtphd4PySwo0wofHyi6udSfrLvLe1nhhl3H"})
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

end
test1 = Congressman_Adapter.new
test2 = test1.usable_data
binding.pry

test3 = "Test"
