class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name].downcase)
  	if user
  	  sign_in user
      #flash[:success] = 'You have logged in'
      redirect_to root_path
    else
      #flash.now[:danger] = 'Invalid email/password combo'
      render 'new'
    end
  end

  def destroy
  	sign_out
  	#flash[:success] = 'You have logged out'
  	redirect_to root_path
  end
end
