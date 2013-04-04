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
#  let(:tag) {Tag.create(name: 'rails')}

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

#describe '#plane' do
 #   it 'has a plane' do
  #     = FactoryGirl.create(:plane)
   #   flight.plane = plane
    #  expect(flight.plane).to eq plane
   # end
  #end

  #describe '#seats' do
   # it 'has seats' do
    #  seat = FactoryGirl.create(:seat)
     # flight.seats << seat
      #expect(flight.seats.count).to eq 1
    #end
  #end
end
