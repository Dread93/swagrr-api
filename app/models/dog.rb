class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :breed
end
