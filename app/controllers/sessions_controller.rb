class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:redirect_url) || root_path
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
