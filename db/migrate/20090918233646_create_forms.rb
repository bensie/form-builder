class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :name
      t.string :email
      t.text :description
      t.boolean :published, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
