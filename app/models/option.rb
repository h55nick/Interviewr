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

class Option < ActiveRecord::Base
  attr_accessible :answer, :is_correct
  belongs_to :exercise
end
