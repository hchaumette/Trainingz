class AddDeflautNameToRounds < ActiveRecord::Migration[7.0]
  def change
    change_column :rounds, :name, :string, default: 'Round 1'
  end
end
