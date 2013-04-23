class Twitkey < ActiveRecord::Base
  attr_accessible :name, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret
  validates_presence_of :name
  validates_presence_of :consumer_key
  validates_presence_of :consumer_secret
  validates_presence_of :oauth_token
  validates_presence_of :oauth_token_secret
end
