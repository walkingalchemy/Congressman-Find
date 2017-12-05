class AddIdsToCongressmen < ActiveRecord::Migration[5.1]
  def change
    add_column :congressmen, :state_id, :integer
    add_column :congressmen, :party_id, :integer
  end
end
