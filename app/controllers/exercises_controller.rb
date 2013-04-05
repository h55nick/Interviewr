class ExercisesController < ApplicationController
  def index
  end
  def create
    @exercise = Exercise.create(question:params[:question], difficulty:params[:difficulty])
    params[:tags].map{ |tag| @exercise.tags << Tag.find(tag)}
    params[:answers].map{|question| @exercise.options << Option.find(question)}
  end
end