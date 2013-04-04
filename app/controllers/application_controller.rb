class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

  private
  def authenticate
    @auth = (session[:person_id].present?) ? Person.find(session[:person_id]) : nil
  end
  #def require_admin
  # redirect_to(root_path) if @auth.nil? || !@auth.is_admin
  #end
end
