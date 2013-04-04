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

class Person < ActiveRecord::Base
  attr_accessible :name, :email, :address, :password, :password_confirmation, :phone, :image_file, :balance, :lat, :long, :customer_id, :is_house
  has_many :results
  has_secure_password
end
