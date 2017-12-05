class CreateCongressmen < ActiveRecord::Migration[5.1]
  def change
    create_table :congressmen do |t|
      t.string :short_title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :api_uri
      t.string :api_id
      t.integer :party
      t.string  :leadership_role
      t.string :twitter_account
      t.string :facebook_account
      t.string :youtube_account
      t.string :url
      t.string :contact_form
      t.boolean :in_office
      t.datetime :next_election
      t.integer :total_votes
      t.integer :missed_votes
      t.string :office_address
      t.string :phone
      t.string :fax
      t.string :state
      t.string :state_rank
      t.float :votes_with_party_pct
    end
  end
end

#
# "id": "A000360",
#   "title": "Senator, 2nd Class",
#   "short_title": "Sen.",
#   "api_uri":"https://api.propublica.org/congress/v1/members/A000360.json",
#   "first_name": "Lamar",
#   "middle_name": null,
#   "last_name": "Alexander",
#   "suffix": null,
#   "date_of_birth": "1940-07-03",
#   "party": "R",
#   "leadership_role": null,
#   "twitter_account": "SenAlexander",
#   "facebook_account": "senatorlamaralexander",
#   "youtube_account": "lamaralexander",
#   "govtrack_id": "300002",
#   "cspan_id": "5",
#   "votesmart_id": "15691",
#   "icpsr_id": "40304",
#   "crp_id": "N00009888",
#   "google_entity_id": "/m/01rbs3",
#   "fec_candidate_id": "S2TN00058",
#   "url": "https://www.alexander.senate.gov/public/",
#   "rss_url": "https://www.alexander.senate.gov/public/?a=RSS.Feed",
#   "contact_form": "http://www.alexander.senate.gov/public/index.cfm?p=Email",
#   "in_office": true,
#   "dw_nominate": 0.323,
#   "ideal_point": null,
#   "seniority": "15",
#   "next_election": "2020",
#   "total_votes": 304,
#   "missed_votes": 8,
#   "total_present": 0,
#   "ocd_id": "ocd-division/country:us/state:tn",
#   "office": "455 Dirksen Senate Office Building",
#   "phone": "202-224-4944",
#   "fax": "202-228-3398",
#   "state": "TN",
#   "senate_class": "2",
#   "state_rank": "senior",
#   "lis_id": "S289"
#   ,"missed_votes_pct": 2.63,
#   "votes_with_party_pct": 97.97
