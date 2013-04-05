# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  answer      :text
#  is_correct  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exercise_id :integer
#

require 'spec_helper'

describe Option do
  let(:option) {Option.create(answer: 'Ruby is ruby', is_correct: true)}

  describe '.new' do
    it 'creates an instance of Option' do
      option = Option.new
      expect(option).to be_an_instance_of(Option)
    end
  end

  describe '.create' do
    it 'has an id' do
      expect(option.id).to_not be nil
    end
  end
end
