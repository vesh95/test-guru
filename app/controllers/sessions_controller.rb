class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:redirect_url].nil?
        redirect_to root_path
      else
        redirect_to cookies[:redirect_url]
        cookies.delete :redirect_url
      end
    else
      flash.now[:alert] = 'Verify login and password please'
      render :new
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])

    if user
      session.delete :user_id
      cookies.delete :redirect_url
      redirect_to login_path
    end
  end
end
