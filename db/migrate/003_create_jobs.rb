class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.integer :pid
      t.string :account_name
      t.string :storm_name
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
