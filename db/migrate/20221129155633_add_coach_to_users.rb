class AddCoachToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coach, :boolean, default: false
  end
end
