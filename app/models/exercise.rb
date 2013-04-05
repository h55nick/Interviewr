# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  question   :text
#  difficulty :integer
#  rating     :float
#  is_public  :boolean
#  code       :string(255)
#  cost       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :integer
#

class Exercise < ActiveRecord::Base
  attr_accessible :question, :difficulty, :rating, :cost, :owner_id, :is_public, :code
  has_many :tags
  has_many :options
  belongs_to :quiz
end
