# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Quiz < ActiveRecord::Base
  attr_accessible :name
  has_many :results
  has_many :exercises
  has_many :tags
  belongs_to :person
end
