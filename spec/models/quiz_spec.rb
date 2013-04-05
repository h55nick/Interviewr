# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Quiz do
  describe '.create' do
    it 'has an id' do
      quiz = Quiz.create(name: 'Ruby Basics')
      expect(quiz.id).to_not be nil
    end
  end
end
