class NewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @dog = current_dog

    render json: @dog.mentions
  end
end
