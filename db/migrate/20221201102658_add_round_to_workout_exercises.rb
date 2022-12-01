class AddRoundToWorkoutExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :workout_exercises, :round, null: false, foreign_key: true
  end
end
