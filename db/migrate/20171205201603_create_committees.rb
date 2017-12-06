class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :committees do |t|
      t.string :name
      t.string :description
      t.string :chamber
      t.string :abbreviation
      t.string :url
      t.string :chair
      t.string :chair_id
      t.string :ranking_member_id
    end
  end
end

#
# "congress": "115",
#          "chamber": "Senate",
#          "id": "SSAF",
#          "name": "Committee on Agriculture, Nutrition, and Forestry",
#          "url": "https://www.agriculture.senate.gov/",
#          "num_results": 20,
#          "chair": "Pat Roberts",
#          "chair_id": "R000307",
#          "chair_party": "R",
#          "chair_state": "KS",
#          "ranking_member_id": "S000770",
#          "current_members": [
#               {
#                  "id": "V000128",
#                  "name": "Chris Van Hollen",
#                  "api_uri":"https://api.propublica.org/congress/v1/members/V000128.json",
#                  "party": "D",
#                  "chamber": "senate",
#                  "side": "minority",
#                  "rank_in_party": null,
#                  "state":"MD",
#                  "note": null,
#                  "begin_date": "2017-01-03"
#                },
#                            {
#                  "id": "G000555",
#                  "name": "Kirsten E. Gillibrand",
#                  "api_uri":"https://api.propublica.org/congress/v1/members/G000555.json",
#                  "party": "D",
