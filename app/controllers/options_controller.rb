class OptionsController < ApplicationController
  def create
    @option = Option.create(answer:params[:answer],is_correct:params[:correct])
  end
end