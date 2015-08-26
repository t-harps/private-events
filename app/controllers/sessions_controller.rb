class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	if user
  	  sign_in user
      flash[:success] = 'You have logged in'
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid name combo'
      render 'new'
    end
  end

  def destroy
  	sign_out
  	flash[:success] = 'You have logged out'
  	redirect_to root_path
  end
end
