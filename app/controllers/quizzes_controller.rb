class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end
  def show
    quiz_id = params[:id]
    @quiz = Quiz.where(:id => quiz_id).first
  end
  def new
  end
  def create
    @quiz = Quiz.create(name:params[:name]) if params[:name].present?
    if @quiz.present? && params[:exercises].present?
      params[:exercises].each do |e|
        @quiz.exercises << ex = Exercise.find(e)
        ex.is_public = !params[:priv]
      end
    end
  end

  def test
    @quiz = Quiz.find(params[:id])
  end


end