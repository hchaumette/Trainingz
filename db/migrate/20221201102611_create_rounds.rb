class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.string :name
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
