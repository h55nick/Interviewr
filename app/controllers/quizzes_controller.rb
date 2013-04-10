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
    quiz_id = params[:id]
    @quiz = Quiz.where(:id => quiz_id).first
    results = @quiz.results.map{|result| {name: result.person.name, score: result.score, date: result.created_at} }
    respond_to do |f|
      f.html #will error until an HTML template is made
      f.js {render :json => results}
    end
  end
  def graph_all
 # results = Results.all.map{|result| {name: result.person.name, score: result.score, date: result.created_at} }

    #respond_to do |f|
     # f.html #will error until an HTML template is made
      #f.js {render :json => results}
    #end

  end

  def create
    @quiz = Quiz.create(name:params[:name]) if params[:name].present?
        binding.pry
    if @quiz.present? && params[:exercises].present?
      params[:exercises].each do |e|
        @e = Exercise.find(e.to_i)
        @e.tags.map{|tag| @quiz.tags << tag}
        @quiz.tags.uniq!
        @quiz.exercises << @e
        @e.is_public = !params[:priv]
        @quiz.save
      end
          binding.pry
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
  client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
  body = "Congratulations on your quiz purchase. Good luck on #{quiz.name}"
  client.account.sms.messages.create(:from => '+16468635581', :to => @auth.phone, :body => body)
  redirect_to(test_quiz_path(quiz.id))
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
      Notifications.test_completed_message(@auth).deliver
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

