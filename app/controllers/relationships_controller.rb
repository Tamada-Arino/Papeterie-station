class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.followers.create(followed_id: params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.followers.find_by(followed_id: params[:user_id]).destroy
    redirect_to request.referer  
  end
end
