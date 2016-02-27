class Fixtimetaught < ActiveRecord::Migration
  def change
    add_column :users, :time_taught, :integer, :default => 0
  end
end
