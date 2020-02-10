class CardsController < ApplicationController
  def new
  end

  def create
    redirect_to regist_completed_path
  end
end
