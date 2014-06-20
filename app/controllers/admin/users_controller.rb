class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_admin

  def index
    @users = User.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Successfully created user"
      redirect_to [:admin, @user]
    else
      flash[:error] = "Unsuccessfully created user"
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Successfully updated user"
      redirect_to [:admin, @user]
    else
      flash[:error] = "Unsuccessfully updated user"
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "Successfully deleted user"
    redirect_to admin_users_path
  end

  private
  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :remember_token, :admin)
  end
end
