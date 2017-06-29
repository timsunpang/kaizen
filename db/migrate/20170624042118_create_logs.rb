class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :exercise_id, null: false
      t.integer :workout_id, null: false
      t.integer :weight, null: true
      t.integer :reps, null: true
      t.integer :time, null: true

      t.timestamps null: false
    end
    add_index :logs, :exercise_id
    add_index :logs, :workout_id
  end
end
