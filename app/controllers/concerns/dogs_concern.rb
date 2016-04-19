module DogsConcern
  def current_dog
    dog = Dog.where(id: request.headers[:HTTP_DOG_ID]).first
    if dog.present? && current_user.dogs.include?(dog)
      return dog
    else
      render json: { message: "Are you sure this is your pup?" }, status: 401
    end
  end
end
