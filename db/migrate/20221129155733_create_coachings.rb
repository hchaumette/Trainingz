class CreateCoachings < ActiveRecord::Migration[7.0]
  def change
    create_table :coachings do |t|
      t.references :coach, null: false, foreign_key: { to_table: :users }
      t.references :trainee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
