class LikesController < ApplicationController
  
  def add
    current_user.likes << Like.new(:user_who_is_liked => params[:friend_id])
    redirect_to root_path
  end
  
  def destroy
    my_like = Like.where("user_id = ? AND user_who_is_liked = ?", current_user.id, params[:id])
    my_like.each do |x|
      x.destroy
    end
    redirect_to root_path
  end
  
  def browse_match
    @users = current_user.get_users
    @page = "match"
  end
  
  def my_matches
    @my_matches = current_user.my_matches
  end
end
