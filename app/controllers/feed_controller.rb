class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @feed = current_dog.followees.map(&:posts)

    render json: @feed
  end
end
