# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  question   :text
#  difficulty :integer
#  rating     :float
#  is_public  :boolean
#  code       :string(255)
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :integer
#

require 'spec_helper'

describe Exercise do
  let(:exercise) {Exercise.create(question: 'What is Ruby?', difficulty: 5, cost: 3.5, is_public: true, code: 5)}
  let(:quiz) {Quiz.create(name: 'Ruby Basics')}
  let(:tag) {Tag.create(name: 'rails')}


  describe '.new' do
    it 'creates an instance of Exercise' do
      exercise = Exercise.new
      expect(exercise).to be_an_instance_of(Exercise)
    end
  end

  describe '.create' do
    it 'has an id' do
      expect(exercise.id).to_not be nil
    end
  end

  describe '#options' do
    it 'has options' do
      exercise = Exercise.new
      option = Option.new
      exercise.options << option
      expect(exercise.options.first).to be_an_instance_of(Option)
    end
  end

  describe '#tags' do
    it 'has tags' do
      exercise = Exercise.new
      tag = Tag.new
      exercise.tags << tag
      expect(exercise.tags.first).to be_an_instance_of(Tag)
    end
  end

  describe '#quiz' do
    it 'belongs to a quiz' do
      quiz.exercises << exercise
      expect(exercise.quiz).to eq quiz
    end
  end


end
