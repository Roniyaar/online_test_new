class AddColumnToResult < ActiveRecord::Migration
  def change
    add_column :results, :answers, :text
    add_column :results, :passed,  :boolean
    add_column :results, :quiz_id, :integer
    add_column :results, :user_id, :integer
  end
end
