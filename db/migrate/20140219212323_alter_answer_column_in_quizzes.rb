class AlterAnswerColumnInQuizzes < ActiveRecord::Migration
  def change
  	rename_column :quizzes, :answer, :answers
  	change_column :quizzes, :answers, :text
  end
end
