class Picture < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description
end
