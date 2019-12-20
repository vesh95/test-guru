class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Verify login and password please'
      render :new
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])

    if user
      session[:user_id] = nil
      redirect_to tests_path
    end
  end
end
