class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :A
      t.string :B
	    t.string :C
	    t.string :D
	    t.string :right_answer
	    t.string :right_choices
	    t.text :write_answer
      t.integer :quiz_id
      t.boolean :correct

      t.timestamps
    end
  end
end
