class BreedsController < ApplicationController
  before_action :authenticate_user!

  # GET /breeds
  def index
    @breeds = Breed.all

    render json: @breeds
  end
end
