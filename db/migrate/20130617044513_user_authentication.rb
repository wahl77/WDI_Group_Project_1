class UserAuthentication < ActiveRecord::Migration
  add_column :users, :password_digest, :string
end
