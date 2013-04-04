require 'spec_helper'

describe Exercise do
  let(:exercise) {Exercise.create(question: 'What is Ruby?', difficulty: 5, cost: 3.5, is_public: true, code: 5)}

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
end
