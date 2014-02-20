class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
    	t.text :answers
	    t.text :create_answer
	    t.integer :duration
	    t.integer :user_id
	    t.integer :category_id
      t.timestamps
    end
  end
end
