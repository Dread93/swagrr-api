module DogsConcern
  def current_dog
    dog = Dog.where(id: params[:dog_handle])
    if current_user.dogs.include? dog
      return dog
    else
      render json: { message: "Are you sure this is your pup?" }, status: 401
    end
  end
end
