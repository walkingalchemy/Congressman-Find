class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :comittees do |t|
      t.string :name
      t.string :description
    end
  end
end
