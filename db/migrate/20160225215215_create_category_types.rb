class CreateCategoryTypes < ActiveRecord::Migration
  def change
    create_table :categorytypes do |t|
    t.references :category
    t.references :user
    end
  end
end
