class AddCompletedLog < ActiveRecord::Migration
  def change
    add_column :logs, :completed?, :boolean, :default => false
  end
end
