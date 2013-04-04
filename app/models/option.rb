class Option < ActiveRecord::Base
  attr_accessible :answer, :is_correct
  belongs_to :exercises
end