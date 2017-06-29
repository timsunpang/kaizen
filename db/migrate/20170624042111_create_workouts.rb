class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name, null: false
      t.boolean :completed?, null: false, default: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :workouts, :user_id
  end
end
