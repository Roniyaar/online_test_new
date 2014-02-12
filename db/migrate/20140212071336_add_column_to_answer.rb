class AddColumnToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :A, :string
    add_column :answers, :B, :string
    add_column :answers, :C, :string
    add_column :answers, :D, :string
    add_column :answers, :right_answer, :string
    add_column :answers, :right_choices, :string
    add_column :answers, :write_answer, :text
  end
end
