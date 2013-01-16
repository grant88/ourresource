class Procedure < ActiveRecord::Base
  attr_accessible :delay, :name, :room
  has_and_belongs_to_many :specialists
end
