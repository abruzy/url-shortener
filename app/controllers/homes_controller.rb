class HomesController < ApplicationController
  def index
    render json: {
      message: 'Welcome to the begining of nothingness!'
    }
  end
end
