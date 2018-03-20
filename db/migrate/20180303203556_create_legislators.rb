class CreateLegislators < ActiveRecord::Migration[5.1]
  def change
    create_table :legislators do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :official_name
      t.string :birthday
      t.string :gender
      t.string :twitter
      t.string :youtube
      t.string :instagram
      t.string :facebook
      t.string :wikipedia
      t.string :thomas_id
      t.timestamps
    end
    add_index :legislators, :thomas_id, unique: true
  end
end
