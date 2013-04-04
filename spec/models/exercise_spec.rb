require 'spec_helper'

describe Exercise do
  describe '.new' do
    it 'creates an instance of Exercise' do
      exercise = Exercise.new
      expect(exercise).to be_an_instance_of(Exercise)
    end
  end

  describe '.create' do
    it 'has an id' do
      exercise = Exercise.create(question: 'What is Ruby?', difficulty: 5, cost: 3.50, is_public: true)
      expect(exercise.id).to_not be nil
  end
end
end
