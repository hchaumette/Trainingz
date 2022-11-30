class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :type_of_workout
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :body_focus

      t.timestamps
    end
  end
end
