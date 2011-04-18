class CreatePrescriptions < ActiveRecord::Migration
  def self.up
    create_table :prescriptions do |t|
      t.datetime :prescribed_at
      t.datetime :archived_at
      t.references :drug
      t.references :indication
      t.references :dosage
      t.references :user
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :prescriptions
  end
end
