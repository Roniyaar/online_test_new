class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :question_category

      t.timestamps
    end
  end
end
