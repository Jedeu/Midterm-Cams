class Droptablecattypes < ActiveRecord::Migration
  def down
    drop_table :categorytypes
  end
end
