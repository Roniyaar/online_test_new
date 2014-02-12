class AddFieldsColumnToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :A, :string
    add_column :questions, :B, :string
    add_column :questions, :C, :string
    add_column :questions, :D, :string
    add_column :questions, :right_answer, :string
  end
end
