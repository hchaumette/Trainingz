class WorkoutExercise < ApplicationRecord
  belongs_to :round
  belongs_to :exercise
end
