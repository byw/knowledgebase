class UsersController < ApplicationController
  before_filter :authenticate_user!
  def edit
    user
  end

  def update
    if user.update_attributes params[:user]
      flash[:notice] = 'Profile updated!'
      sign_in user, bypass: true
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  protected

  def user
    @user ||= current_user
  end
end
