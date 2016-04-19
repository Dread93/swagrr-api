class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /dogs
  def index
    @dogs = Dog.all

    render json: @dogs
  end

  # GET /my_dogs
  def my_dogs
    render json: current_user.dogs
  end

  # GET /current_dog
  def current_dog
    render json: current_dog
  end

  # GET /dogs/1
  def show
    render json: @dog
  end

  # POST /dogs
  def create
    @dog = current_user.dogs.new(dog_params)

    if @dog.save
      render json: @dog, status: :created, location: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dogs/handle
  def update
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # GET /dogs/handle/follow
  def follow
    unless following?(@dog.handle)
      current_dog.follow @dog
    end
  end

  # GET /dogs/handle/unfollow
  def unfollow
    if following?(@dog.handle)
      current_dog.unfollow @dog
    end
  end

  # DELETE /dogs/1
  def destroy
    @dog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find_by_handle(params[:handle])
    end

    # Only allow a trusted parameter "white list" through.
    def dog_params
      params.require(:dog).permit(:handle, :breed_id, :avatar_url, :name, :bio, :sex, :website)
    end
end
