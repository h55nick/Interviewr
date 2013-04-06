# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :text
#  email           :string(255)
#  password_digest :string(255)
#  phone           :string(255)
#  image_file      :text
#  balance         :float
#  lat             :float
#  long            :float
#  customer_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_house        :boolean          default(FALSE)
#

require 'spec_helper'

describe Person do
  let(:quiz) {Quiz.create(name: 'Ruby Basics')}
  let(:person) {Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')}
  let(:result) {Result.create(score: 99)}

  describe '.new' do
    it 'creates an instance of Person' do
      person = Person.new
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '.create' do
    it 'has an id' do
      expect(person.id).to_not be nil
      #expect(person.is_house).to eq false
    end
  end

  describe '#quizzes' do
    it 'has quizzes' do
      person.quizzes << quiz
      expect(person.quizzes.first).to be_an_instance_of(Quiz)
    end
  end

  describe '#quizzes' do
    it 'has results' do
      person.results << result
      expect(person.results.first).to be_an_instance_of(Result)
    end
  end
end
