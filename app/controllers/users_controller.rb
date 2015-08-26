class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      redirect_to root_path
  	else
  	  render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  private
    def user_params
  	  params.require(:user).permit(:name, :email, :password_digest)	 							 
  	end
end
