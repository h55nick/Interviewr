class ExercisesController < ApplicationController
  def index
  end
  def create
    if params[:answers].present? && params[:question].present?
      @exercise = Exercise.create(question:params[:question], difficulty:params[:difficulty], cost:params[:cost])
      params[:tags].map{ |tag| @exercise.tags << Tag.find(tag)} if params[:tags].present?
      params[:answers].map{|questionid| @exercise.options << Option.find(questionid)}
    end
  end
end