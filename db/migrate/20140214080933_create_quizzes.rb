class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.string :answer1
	    t.string :answer2
	    t.string :answer3
	    t.string :answer4
	    t.text :create_answer
	    t.integer :user_id
      t.timestamps
    end
  end
end
