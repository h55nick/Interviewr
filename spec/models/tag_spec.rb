# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
describe Tag do
  let(:tag) {Tag.create(name: 'rails')}
  let(:quiz) {Quiz.create(name: 'Ruby Basics')}

  describe '.new' do
    it 'creates an instance of a tag' do
      tag = Tag.new
      expect(tag).to be_an_instance_of(Tag)
    end
  end

  describe '.create' do
    it 'creates a tag' do
      tag = Tag.create(name:"rails")
      tag.should be_an_instance_of(Tag)
      tag.name.should eq "rails"
    end
  end

  describe '#quizzes' do
    it 'list quizzes that have a specific tag' do
      tag = Tag.new
      tag.quizzes << quiz
      expect(tag.quizzes.first).to eq quiz
    end
  end

end
