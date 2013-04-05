# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  attr_accessible :name
  has_many :results
  has_many :exercises
  has_and_belongs_to_many :tags
  belongs_to :person


  def total_cost
    costs = []
    self.exercises.each do |exercise|
      cost = exercise.cost
      costs << cost
      end
  end

end
