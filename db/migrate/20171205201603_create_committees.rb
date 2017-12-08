class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :committees do |t|
      t.string :name
      t.string :chamber
      t.string :abbreviation
      t.string :url
      t.string :chair
      t.string :chair_id
      t.string :ranking_member_id
    end
  end
end
