class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :results
  belongs_to :quizzes
end