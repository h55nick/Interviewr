class SessionController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    person = Person.where(:email => params[:email]).first
    if person.present? && person.authenticate(params[:password])
      session[:person_id] = person.id
    else
      session[:person_id] = nil
    end
    authenticate
    redirect_to(person_path(@auth))
  end

  def destroy
    session[:person_id] = nil
    authenticate
    redirect_to(root_path)
  end
end