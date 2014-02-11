class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :question_answer
      t.text :correct_answer
      t.integer :question_id

      t.timestamps
    end
  end
end
