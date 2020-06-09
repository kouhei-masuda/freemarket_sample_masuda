class CardsController < ApplicationController
  def new
  end

  def create
    redirect_to controller: 'users/registrations', action: 'completed'
  end
end
