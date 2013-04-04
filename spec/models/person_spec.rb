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
#

require 'spec_helper'

describe Person do
  describe '.create' do
    it 'has an id' do
      person = Person.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(person.id).to_not be nil
      expect(person.is_house).to eq false
    end
  end
end
