class State < ApplicationRecord
	has_many :cities
	has_many :customers
	has_many :people
	validates_presence_of :name
end
