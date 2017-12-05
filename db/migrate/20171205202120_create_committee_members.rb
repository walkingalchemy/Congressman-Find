class CreateCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_members do |t|
      t.integer :committee_id
      t.integer :congressman_id
    end
  end
end
