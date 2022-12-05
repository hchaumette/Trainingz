class Workout < ApplicationRecord
  belongs_to :user
  has_many :rounds
  has_many :workout_exercises, through: :rounds
end
