class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :rating
      t.integer :balance
      t.text :bio
      t.time :time_taught
      t.boolean :has_taught, default: false
      t.timestamps null: false
    end
  end
end
