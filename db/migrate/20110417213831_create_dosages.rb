class CreateDosages < ActiveRecord::Migration
  def self.up
    create_table :dosages do |t|
      t.string :units
      t.integer :strength
      t.integer :dose
      t.integer :frequency
      t.string :form
      t.string :route
      t.references :drug

      t.timestamps
    end
  end

  def self.down
    drop_table :dosages
  end
end
