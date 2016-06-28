class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:update_success] = t "application.flash.users.updated_success"
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end
end
