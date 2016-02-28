class DropAndMakeTimeTaught < ActiveRecord::Migration
  def change
    remove_column :users, :time_taught
  end
end
