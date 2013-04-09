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
  def graph
    person_id = params[:id]
    @person = Person.where(:id => person_id).first
    results = @person.results.map{|result| {name: result.quiz.name, score: result.score, date: result.created_at} }
    respond_to do |f|
      f.js {render :json => results}
    end
  end

end