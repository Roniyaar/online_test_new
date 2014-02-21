class CreateDescriptives < ActiveRecord::Migration
  def change
    create_table :descriptives do |t|
      t.integer :question_id
      t.text :answers
      t.integer :user_id
      t.integer :quiz_id
      t.boolean :mark_answer

      t.timestamps
    end
  end
end
