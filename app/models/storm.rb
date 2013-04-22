class Storm < ActiveRecord::Base
  attr_accessible :name, :tweets
  validates_presence_of :name
  validates_presence_of :tweets
end
