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
    if @auth.present?
    @quiz = Quiz.find(params[:id])
  else
      redirect_to(root_path)
    end
  end
  def quizresults
    if @auth.present?
      @result = Result.create(quiz_id:params[:qid],score:params[:score])
      @auth.results << @result
    else
      @result = false
    end
  end
  def filter
    tag = Tag.find(params[:tag_id])
    @quizzes = tag.quizzes
  end
  def search
    query = params[:query]
    @quizzes = Quiz.where("name @@ :q", :q => query)

    tags = Tag.where("name @@ :q", :q => query)
    @quizzes += tags.map(&:quizzes).flatten

    options = Option.where("answer @@ :q", :q => query)
    @quizzes += options.map(&:exercise).compact.map(&:quiz).flatten

     exercises = Exercise.where("question @@ :q", :q => query)
    @quizzes += exercises.map(&:quiz).flatten

    people = Person.where("name @@ :q", :q => query)
    @quizzes += people.map(&:quizzes).flatten
    @quizzes.uniq!

    render :filter
  end
end
