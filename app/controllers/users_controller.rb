class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :update_profile]
  before_action :set_user, only: [:show, :follows, :followers]

  def show
  end

  def profile
    if current_user.email == 'guest@example.com'
      redirect_to user_path(current_user.id), alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  def update_profile
    if current_user.update(profile_params)
      redirect_to user_path(current_user.id), notice: 'プロフィールが更新されました。'
    else
      render :profile
    end
  end

  def follows
  end

  def followers
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:avatar, :name, :introduction)
  end
end
