class AddUrlSafekey < ActiveRecord::Migration
  def change
    add_column :sessions, :url_key, :string
  end
end
