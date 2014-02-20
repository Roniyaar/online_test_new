class AddCorrectAnswersToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :correct_answers, :integer
  end
end
