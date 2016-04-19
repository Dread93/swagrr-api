class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include DogsConcern
  include PhotoHelpersConcern
end
