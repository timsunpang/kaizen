class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :height, null: true
      t.integer :weight, null: true

      t.timestamps null: false
    end

    add_index :users, :username
  end
end
