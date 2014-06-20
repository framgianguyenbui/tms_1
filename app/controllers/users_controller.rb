class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def show
  end

  private
    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email, :remember_token)
    end
end
