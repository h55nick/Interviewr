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
  let(:quiz) {Quiz.create(name: 'Ruby Basics')}
  let(:person) {Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')}
  let(:result) {Result.create(score: 99)}

  describe '#create' do
    it 'creates an instance of Result' do
    quiz.results << result
    person.results << result
    expect(person.id).to_not be nil
    expect(quiz.id).to_not be nil
    expect(person.results).to_not be nil
    expect(quiz.results).to_not be nil
    expect(person.results.first.score).to eq 99.0
    end
  end

  describe '#person' do
    it 'belongs to a person' do
      person.results << result
      expect(result.person).to eq person
    end
  end

  describe '#quiz' do
    it 'belongs to a quiz' do
      quiz.results << result
      expect(result.quiz).to eq quiz
    end
  end

end
