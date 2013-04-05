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
    @quiz = Quiz.find(params[:id])
  end
end