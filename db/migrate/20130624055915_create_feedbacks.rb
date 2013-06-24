class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.string :content

      t.timestamps
    end
    add_index :feedbacks, :user_id
  end
end
