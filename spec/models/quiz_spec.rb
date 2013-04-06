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

require 'spec_helper'

describe Quiz do
  let(:exercise) {Exercise.create(question: 'What is Ruby?', difficulty: 5, cost: 3.5, is_public: true, code: 5)}
  let(:quiz) {Quiz.create(name: 'Ruby Basics')}
  let(:person) {Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')}
  let(:result) {Result.create(score: 99)}

  describe '.new' do
    it 'creates an instance of Quiz' do
      quiz = Quiz.new
      expect(quiz).to be_an_instance_of(Quiz)
    end
  end

  describe '.create' do
    it 'has an id' do
      expect(quiz.id).to_not be nil
    end
  end

  describe '#exercises' do
    it 'has exercises' do
      quiz.exercises << exercise
      expect(quiz.exercises.first).to be_an_instance_of(Exercise)
    end
  end

  describe '#results' do
    it 'has results' do
      quiz.results << result
      expect(quiz.results.first).to be_an_instance_of(Result)
    end
  end

  describe '#person' do
    it 'belongs to a person' do
      person.quizzes << quiz
      expect(quiz.person).to eq person
    end
  end

end
