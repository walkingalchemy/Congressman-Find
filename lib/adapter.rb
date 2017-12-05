class Adapter

attr_reader :response, :data

  def initialize
    url = "https://api.propublica.org/congress/v1/115/senate/members.json"
    @response = RestClient.get(url, {"X-API-KEY" => "2QhdrNtphd4PySwo0wofHyi6udSfrLvLe1nhhl3H"})
  end

  def usable_data
      @data = JSON.parse(self.response)
  end


# url = "https://api.propublica.org/congress/v1/115/senate/members.json"
  # def add_to_table
  #     member_data = self.usable_data["results"][0]["members"][0]
  #     member_data.each do |member|
  #       puts member["first_name"] + member["last_name"]
  #       # Congressman.create
  #     end
  # end

end

test1 = Adapter.new
test2 = test1.usable_data
members = test2["results"][0]["members"]
members.each do |member|
  puts "#{member["first_name"]} #{member["last_name"]}"
end

# test3 = test2.add_to_table
# test4 = test3[0]# test2.add_to_table
# # class2 = class1["membs
binding.pry

test3 = "Test"
