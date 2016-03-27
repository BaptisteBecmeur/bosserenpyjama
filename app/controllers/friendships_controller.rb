class FriendshipsController < ApplicationController

def create
if current_user.friends.size >= 10 || current_user.friendships.where(friend_id: params[:friend_id]).any? || current_user.id == params[:friend_id]
flash[:notice] = "You already have added this user."
redirect_to users_path
else
@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
if @friendship.save
flash[:notice] = "Added friend."
redirect_to current_user
else
flash[:error] = "Unable to add friend."
redirect_to current_user
end
end
end

def destroy
@friendship = current_user.friendships.find(params[:id])
@friendship.destroy
flash[:notice] = "Removed friendship."
redirect_to current_user
end
end
