class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
    	t.string :boby
    	t.integer :user_id
    	t.integer :comment_id
    	t.integer :reply_to
      	t.timestamps
    end
  end
end
