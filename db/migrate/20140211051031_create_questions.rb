class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.integer :category_id
      t.integer :option_type

      t.timestamps
    end
  end
end
