class AddUniqueness < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, unique: true
    add_index :exercises, :name, unique: true
    add_index :workouts, [:name, :user_id], unique: true
    add_index :records, [:user_id, :exercise_id], unique: true
  end
end
