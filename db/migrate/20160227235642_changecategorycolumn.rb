class Changecategorycolumn < ActiveRecord::Migration
  def up
    rename_column :categories, :type, :tag
  end
end
