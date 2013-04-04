class Result < ActiveRecord::Base
  attr_accessible :person_id, :quiz_id, :score
  belongs_to :people
  belongs_to :quizzes
end
