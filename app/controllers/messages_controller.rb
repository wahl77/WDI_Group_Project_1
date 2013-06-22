class MessagesController < ApplicationController
  def inbox
    @messages = Message.where("user_id = ?", current_user.id).order("created_at DESC")
  end
  
  def message_compose
    @message = Message.new
  end
  
  def create
    message = Message.new
    message.content = params[:message][:content]
    message.user_id = params[:message][:user_id]
    message.sender = current_user.id
    if message.save
      redirect_to "/matches"
    else
      render message_compose
    end
  end
  
  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to inbox_path
  end
  
  def message_from
    @messages = Message.where("user_id = ? AND sender = ?", current_user.id, params[:id]).order("created_at DESC")
  end
end
