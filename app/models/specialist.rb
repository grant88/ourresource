class Specialist < ActiveRecord::Base
  attr_accessible :admin, :fio, :login, :mode_id, :password, :room
  has_and_belongs_to_many :procedures
end
