class Event < ActiveRecord::Base
	has_many :users
	validates_presence_of :title
end
