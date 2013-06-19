class DeletePasswordDigestAndReplaceWithLinkedinEmail < ActiveRecord::Migration
  def change
    remove_column :users, :age
    remove_column :users, :gender
    remove_column :users, :uun
    remove_column :users, :password_digest
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    change_table :locations do |t|
      t.references :user_id
    end
    drop_table :locations_users
    add_column :users, :email, :string
  end
end
