class MessagesController < ApplicationController
  def inbox
    @messages = Message.where("receiver_id = ?", current_user.id).order("created_at DESC")
  end
  
  def message_compose
    @message = Message.new
  end
  
  def create
    @message = Message.new
    @message.content = params[:message][:content]
    @message.receiver_id = params[:message][:receiver_id]
    @message.sender_id = current_user.id
    
    # Make sure there is no injection. Don't care about warnings, it's a hacker!
    return false unless current_user.my_matches.include? User.find(params[:message][:receiver_id])
    
    respond_to do |format|
      
      format.js { @message.save }
      
      format.html{
        if @message.save
          redirect_to "/message_from/#{message.receiver_id}"
        else
          render @message_compose
        end
      }
    end
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
        format.js
        format.html{
          redirect_to "/message_from/#{@message.receiver_id}"  
        }
    end
  end
  
  def message_from
    @messages = Message.where("(receiver_id = ? AND sender_id = ?) OR (receiver_id = ? AND sender_id = ?)", current_user.id, params[:id], params[:id], current_user.id).order("created_at DESC")
    @message = Message.new
  end
end
