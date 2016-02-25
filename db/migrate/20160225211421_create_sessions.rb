class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t| 
      t.string :review_title
      t.text :review_content
      t.integer :review_rating
      t.integer :teacher_id
      t.references :user
      t.time :start_time
      t.time :end_time
      t.time :duration
      t.timestamps null: false
    end
  end
end
