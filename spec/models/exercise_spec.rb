require 'spec-helper'

describe Exercise do
  let(:exercise) {Exercise.create(question: 'Wnat is Ruby?', difficulty: 5, cost: 3.5, is_public: true)}

  describe '.new' do
    it 'creates an instance of Exercise'
    exercise = Exercise.new
    expect(exercise).to be_an_instance of(Exercise)
  end

  describe '.create'
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