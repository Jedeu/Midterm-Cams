class Fixallthethings < ActiveRecord::Migration
  def change
    remove_column :rooms, :start_time
    remove_column :rooms, :end_time
    remove_column :rooms, :duration
    add_column :rooms, :classtime, :integer
  end
end
