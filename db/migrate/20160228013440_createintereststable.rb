class Createintereststable < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :category_id
      t.integer :user_id
    end
  end
end
