class Addimage < ActiveRecord::Migration
  def self.up
    add_column :users, :image, :string
  end
end
