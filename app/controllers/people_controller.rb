class PeopleController < ApplicationController
  def index
  end
  def new
    @person = Person.new
  end
  def create
    @person = Person.create(params[:person])
  end
  def show
    @person = Person.find(params[:id])
  end

end