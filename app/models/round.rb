class Round < ApplicationRecord
  belongs_to :workout
  has_many :workout_exercises
end
