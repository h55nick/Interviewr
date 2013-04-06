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
  def graph
    r = Result.all
    names = r.map{|r| r.person.name}.uniq
    # scores = r.map{|r| r.score}
    # dates = r.map{|r| r.created_at}

    respond_to do |f|
      f.html #will error until an HTML template is made
      f.js {render :json => r}
    end
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
end





