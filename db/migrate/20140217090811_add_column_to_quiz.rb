class AddColumnToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :duration, :integer
  end
end
