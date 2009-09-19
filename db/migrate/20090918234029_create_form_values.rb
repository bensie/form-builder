class CreateFormValues < ActiveRecord::Migration
  def self.up
    create_table :form_values do |t|
      t.integer :submission_id
      t.integer :form_field_id
      t.string :entry
      t.datetime :entry_datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :form_values
  end
end
