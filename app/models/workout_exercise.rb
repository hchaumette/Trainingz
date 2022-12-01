class WorkoutExercise < ApplicationRecord
  belongs_to :round
  belongs_to :exercice
end
