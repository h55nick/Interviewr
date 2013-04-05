# == Schema Information
#
# Table name: results
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  quiz_id    :integer
#  score      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Result < ActiveRecord::Base
  attr_accessible :person_id, :quiz_id, :score
  belongs_to :person
  belongs_to :quiz
end
