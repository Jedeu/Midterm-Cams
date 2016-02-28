class UpdateColumnTypes < ActiveRecord::Migration
  def up
    change_column :users, :rating, :integer, :default => 0
    change_column :users, :balance, :integer, :default => 0
    change_column :users, :hourly_rate, :integer, :default => 0
  end

  def down
    change_column :users, :rating, :integer, :default => nil
    change_column :users, :balance, :integer, :default => nil
    change_column :users, :hourly_rate, :integer, :default => nil
  end
end
