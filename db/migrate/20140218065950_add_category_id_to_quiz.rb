class AddCategoryIdToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :category_id, :integer
  end
end
