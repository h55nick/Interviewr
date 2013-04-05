class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
  def new
    @quiz = Quiz.new
  end
  def create
    @quiz = Quiz.create(params[:quiz])
  end
  def show
    @quizzes = Quiz.all
    @quiz = Quiz.first
  end
end