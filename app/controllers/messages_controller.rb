class MessagesController < ApplicationController
  def inbox
    @messages = Message.where("user_id = ?", current_user.id).order("created_at DESC")
  end
  
  def compose
    @message = Message.new
    @my_friends = current_user.my_matches
  end
  
  def create
    message = Message.new
    message.content = params[:message][:content]
    message.user_id = params[:message][:user_id]
    message.sender = current_user.id
    if message.save
      redirect_to inbox_path
    else
      render compose
    end
  end
  
  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to inbox_path
  end
end
