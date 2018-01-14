class MeController < ApplicationController
  def index
    render json: authorize!(:read, current_user)
  end
end
