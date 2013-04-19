class CreateStorms < ActiveRecord::Migration
  def self.up
    create_table :storms do |t|
      t.string :name
      t.text :tweets
      t.timestamps
    end
  end

  def self.down
    drop_table :storms
  end
end
