class CreateTwitkeys < ActiveRecord::Migration
  def self.up
    create_table :twitkeys do |t|
      t.string :name
      t.string :consumer_key
      t.string :consumer_secret
      t.string :oauth_token
      t.string :oauth_token_secret
      t.timestamps
    end
  end

  def self.down
    drop_table :twitkeys
  end
end
