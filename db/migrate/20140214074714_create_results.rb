class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
    	t.text :answers
	    t.boolean :passed
	    t.integer :quiz_id
	    t.integer :user_id
      t.timestamps
    end
  end
end
