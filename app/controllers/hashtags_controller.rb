class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]
  before_action :authenticate_user!

  # GET /hashtags
  def index
    @hashtags = Hashtag.all

    render json: @hashtags
  end

  # GET /hashtags/name
  def show
    render json: @hashtag
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hashtag
      @hashtag = Hashtag.find_by_name(params[:name])
    end

    # Only allow a trusted parameter "white list" through.
    def hashtag_params
      params.require(:hashtag).permit(:name)
    end
end
