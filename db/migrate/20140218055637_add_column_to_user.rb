class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :text
    add_column :users, :mobile_no, :integer
  end
end
