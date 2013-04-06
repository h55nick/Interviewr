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
  def purchase
    quiz = Quiz.find(params[:id])
  begin
    if @auth.customer_id.nil?
      customer = Stripe::Customer.create(email: @auth.email, card: params[:token])
      @auth.customer_id = customer.id
      @auth.save
    end
    Stripe::Charge.create(customer: @auth.customer_id, amount: (quiz.total_cost * 100).to_i, description: quiz.name, currency: 'usd')
  rescue Stripe::CardError => @error
  end
  end
  def test
    @quiz = Quiz.find(params[:id])
  end

  def filter
    tag = Tag.find(params[:tag_id])
    @quizzes = tag.quizzesg
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
