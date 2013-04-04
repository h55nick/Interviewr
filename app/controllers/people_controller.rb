class PeopleController < ApplicationController
  def index
  end
  def new
    @person = Person.new
  end
  def create
    @person = Person.create
  end
end