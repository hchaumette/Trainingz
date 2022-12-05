class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.integer :duration
      t.integer :rest_time
      t.integer :repetitions
      t.string :demonstration
      t.string :title
      t.string :equipment

      t.timestamps
    end
  end
end
