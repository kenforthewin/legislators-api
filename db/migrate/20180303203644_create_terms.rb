class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.integer :legislator_id
      t.integer :party_id
      t.integer :state_id
      t.date :start_date
      t.date :end_date
      t.string :type
      t.string :district
      t.string :url
      t.string :address
      t.string :phone
      t.string :fax

      t.timestamps
    end
    add_index :terms, :legislator_id
    add_index :terms, :party_id
    add_index :terms, :state_id
  end
end
