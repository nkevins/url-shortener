class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.references :link, foreign_key: true
      t.string :browser
      t.string :platform
      t.datetime :access_time
      
      t.timestamps
    end
  end
end
