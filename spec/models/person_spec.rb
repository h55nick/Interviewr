require 'spec_helper'

describe Person do
  describe '.create' do
    it 'has an id' do
      person = Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(person.id).to_not be nil
    end
  end
end