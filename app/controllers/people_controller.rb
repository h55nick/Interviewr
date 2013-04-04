class PeopleController < ApplicationController
  def index
  end
  def new
    @person = People.new
  end
  def create

  end
end