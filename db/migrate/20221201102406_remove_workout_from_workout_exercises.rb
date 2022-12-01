class RemoveWorkoutFromWorkoutExercises < ActiveRecord::Migration[7.0]
  def change
    remove_reference :workout_exercises, :workout, foreign_key: true
  end
end
