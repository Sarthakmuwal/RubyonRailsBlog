class SessionsController < ApplicationController
  before_action :authenticate_user , only: :new
  def new 
    @user = User.new
  end
  def create
    @user = User.find_by(name: params[:name])

    if @user.present? && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:user_id] = 'Successfully checked in'
        redirect_to root_path
    else
        render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path,status: :see_other
  end

  private
  def authenticate_user
    if Current.user
       redirect_to '/'
    end
  end
  def login_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end