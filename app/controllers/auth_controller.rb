#fully custom version of auth
class AuthController < ApplicationController
  def reg
  end

  def do_reg
    @user = User.create(email:params[:email],name:params[:name],password: Digest::MD5.hexdigest(params[:password]))
    if @user.errors.empty?
      redirect_to root_path
    else
     flash[:status] = "Error here"
     redirect_to reg_path
    end
  end

  def login
  end

  def do_login
    @user = User.where('login = ?',params[:email])
    if @user.blank?
      redirect_to login_path
    else
      session[:user] = @user
      redirect_to root_path
    end
  end
end
