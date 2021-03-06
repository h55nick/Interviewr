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
      costs.reduce(:+).to_f
  end

  def owner
    id = self.person_id
    person = Person.where(:id => id).first
    name = person.name
  end
  def people
    self.results.map{|r| r.person}.uniq
  end

  def avgscore(person)
    r = self.results.where(:person_id => person)
    totalpos = r.count*10
    tscore = r.map {|x| x.score}.inject(&:+)
    (tscore/totalpos) * 100
  end

  def overall_difficulty
    diffs = []
    self.exercises.each do |exercise|
      diff = exercise.difficulty
      diffs << diff
      end
      total = diffs.reduce(:+).to_f
      if total > 0
        average = total/(self.exercises.count).to_i
        average = (average * 100).round.to_f / 100
      else
        average = 0
      end
  end

  def overall_rating
    ratings = []
    self.exercises.each do |exercise|
      rating = exercise.rating
      ratings << rating
      end
      total = ratings.reduce(:+).to_f
      if total > 0
        average = total/(self.exercises.count).to_i
        average = (average * 100).round.to_f / 100
      else
        average = 0
      end
  end

end
