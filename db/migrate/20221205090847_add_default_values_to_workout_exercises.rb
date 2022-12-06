class AddDefaultValuesToWorkoutExercises < ActiveRecord::Migration[7.0]
  def change
    change_column :workout_exercises, :duration, :integer, default: 30
    change_column :workout_exercises, :rest_duration, :integer, default: 0
    change_column :workout_exercises, :repetitions, :integer, default: 10
  end
end
