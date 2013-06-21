class LikesController < ApplicationController
  
  def add
    current_user.likes << Like.new(:user_who_is_liked => params[:friend_id])
    
    redirect_to root_path
  end
  
  def delete
    my_like = Like.where("user_id = #{current_user.id} AND user_who_is_liked = #{params[:friend_id]}")
    my_like.each do |x|
      x.destroy
    end
    redirect_to root_path
  end
end
