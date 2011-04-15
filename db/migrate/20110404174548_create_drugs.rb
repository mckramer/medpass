class CreateDrugs < ActiveRecord::Migration
  def self.up
    create_table :drugs do |t|
      t.string :name
      t.string :abbr
      t.text :description
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :drugs
  end
end
