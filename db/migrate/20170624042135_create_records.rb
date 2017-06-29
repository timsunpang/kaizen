class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, null: false
      t.integer :exercise_id, null: false
      t.integer :max_weight, null: true
      t.integer :max_reps, null: true
      t.integer :max_time, null: true

      t.timestamps null: false
    end

    add_index :records, :user_id
    add_index :records, :exercise_id
  end
end
