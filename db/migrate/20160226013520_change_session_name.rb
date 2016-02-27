class ChangeSessionName < ActiveRecord::Migration
  def self.up
    rename_table :sessions, :rooms
  end

  def self.down
    rename_table :rooms, :sessions
  end
end
