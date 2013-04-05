class QuizController < ApplicationController
  def new

  end
  def create
    @quiz = Quiz.create(name:params[:name])
    params[:exercises].each do |e|
      @quiz.exercises << e
      e.is_public = !params[:priv]
    end
        binding.pry
  end
end