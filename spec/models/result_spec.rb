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

require 'spec_helper'

describe Result do
  describe '#create' do
    it 'creates an instance of Result' do
    person = Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
    quiz = Quiz.create(name: 'Ruby Basics')
    result = Result.create(score: 99)
    quiz.results << result
    person.results << result
    expect(person.id).to_not be nil
    expect(quiz.id).to_not be nil
    expect(person.results).to_not be nil
    expect(quiz.results).to_not be nil
    expect(person.results.first.score).to eq 99.0
    end
  end
end
