require 'spec_helper'

describe Result do
  describe '#create' do
    it 'creates an instance of Result' do
    result = Result.create(score:99)
    person = Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
    quiz = Quiz.create(name: 'Ruby Basics')
    quiz.results << result
    person.results << result
    expect(person.id).to_not be nil
    expect(quiz.id).to_not be nil
    expect(person.results).to_not be nil
    expect(person.results.first.score).to eq 99.0
    end
  end
end
