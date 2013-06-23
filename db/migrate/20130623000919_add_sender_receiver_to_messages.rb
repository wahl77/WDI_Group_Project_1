class AddSenderReceiverToMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :sender
    remove_column :messages, :user_id
    add_column :messages, :sender_id, :integer
    add_column :messages, :receiver_id, :integer
  end
end
