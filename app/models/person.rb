class Person < ApplicationRecord
	belongs_to :state
	belongs_to :city
	validates_presence_of :name, :email, :mobile, :state_id, :city_id
end
