require_relative 'config/environment'

will = Congressman.create(first_name: "William", last_name: "Rob")
jane = Congressman.create(first_name: "Jane", last_name: "Fonda")

marsha = Congressman.create(first_name: "Marsha", middle_name: "T", last_name: "Warshington")

rep = Party.create(name: "Republican")
dem = Party.create(name: "Democrat")

ny = State.create(name: "New York", :abbreviation "NY")
nj = State.create(name: "New Jersey", :abbreviation "NJ")
binding.pry
help = "help!"
