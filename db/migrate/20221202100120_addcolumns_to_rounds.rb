class AddcolumnsToRounds < ActiveRecord::Migration[7.0]
  def change
    add_column :rounds, :sets, :integer, default: 1
    add_column :rounds, :exercises_time, :integer, default: 30
    add_column :rounds, :exercises_rest, :integer, default: 0
    add_column :rounds, :round_rest, :integer, default: 30
    add_column :rounds, :exercises_reps, :integer, default: 10
  end
end
