class CreateIndications < ActiveRecord::Migration
  def self.up
    create_table :indications do |t|
      t.string :text
      t.text :description
      t.references :drug

      t.timestamps
    end
  end

  def self.down
    drop_table :indications
  end
end
