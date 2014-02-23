class AlterTableToDescriptives < ActiveRecord::Migration
  def change
  	rename_column :descriptives, :answers, :descriptive_answer
  end
end
