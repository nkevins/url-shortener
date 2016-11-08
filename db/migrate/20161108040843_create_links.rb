class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :shortened
      t.string :original
      t.integer :hit, :default => 0

      t.timestamps
    end
    add_index :links, :shortened, :unique => true
  end
end
