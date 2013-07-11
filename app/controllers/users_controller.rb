class UsersController < ApplicationController
  include SecureRandom

  skip_before_filter :validate_login, :authenticate
  def index
    render :login
  end

  def authenticate
    temp_user = User.find_by_email(params[:user][:email])
    flash[:errors] ||= []

    if temp_user.password == params[:user][:password]
      temp_user.user_token = SecureRandom.base64
      session[:token] = temp_user.user_token
      redirect_to bands_url
    else
      flash[:errors] << "incorrect password"
    end
  end

  def new
    render :new
  end

  def create
    user = User.new(params[:user])
    flash[:errors] ||= []

    if user.save
      user.user_token = SecureRandom.base64
      msg = UserMailer.activation_email(user)
      msg.deliver!
      flash[:errors] << "Please click activation link in your email"
      redirect_to users_url
    else
      flash[:errors] << "Could not create account"
    end

  end

  def destroy

  end

  def activate
    user = User.find(params[:id])
    flash[:errors] ||= []
    if user.user_token == params[:token]
      user.status = "activated"
    else
      flash[:errors] << "Not your token"
    end
    if user.save
      render :login
    else
      flash[:errors] << "Something went wrong"
    end
  end

end
