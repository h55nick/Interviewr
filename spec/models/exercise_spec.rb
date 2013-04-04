require 'spec-helper'

describe Exercise do
  describe '.new' do
    it 'creates an instance of Exercise'
    exercise = Exercise.new
    expect(exercise).to be_an_instance of(Exercise)
  end

  describe '.create'
    it 'has an id' do
    exercise = Exercise.create(question: 'Wnat is Ruby?', difficulty: 5, :cost 3.50, :is_public true)
    expect(exercise.id).to_not be nil
end
end
