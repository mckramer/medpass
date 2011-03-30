class CreateConditions < ActiveRecord::Migration
  def self.up
    create_table :conditions do |t|
      t.string :name
      t.string :abbr
      t.text :description
      t.string :icd9

      t.timestamps
    end
  end

  def self.down
    drop_table :conditions
  end
end
