class AddImageToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :image_url, :string
  end
end
