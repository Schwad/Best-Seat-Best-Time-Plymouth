class Room < ActiveRecord::Base
  has_many :datapoints
end
