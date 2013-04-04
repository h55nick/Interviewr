class Exercise < ActiveRecord::Base
  attr_accessible :question, :difficulty, :rating, :cost, :owner_id, :is_public
  has_many :tags
  has_many :results
end