class RegistrationsController < ApplicationController
  before_action :authenticate_user
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id
       redirect_to root_path
    else
        puts @user.errors.full_messages
        render :new, status: :unprocessable_entity
    end
  end
  
  private 
  def authenticate_user
    if Current.user
       redirect_to root_path
    end
  end
  def user_params
   params.require(:user).permit(:name,:password,:password_confirmation,:dob,:photo,:admin_user)
  end
end