class CreateParties < ActiveRecord::Migration[5.1]
  def change
    create_table :parties do |t|
      t.string :name

      t.timestamps
    end
    add_index :parties, :name, unique: true
  end
end
