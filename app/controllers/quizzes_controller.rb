class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
  def show
    @quizzes = Quiz.all
    quiz_id = params[:id]
    @quiz = Quiz.where(:id => quiz_id).first
  end
end