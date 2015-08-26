class EventsController < ApplicationController
  before_action :sign_in, only: [:new, :create]

  def index
  	@events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.created_events.build(event_params)
  	if @event.save
  	  flash[:success] = "Event successfully created"
      redirect_to root_path
  	else
  	  flash[:error] = "Error creating event"
  	  render 'new'
  	end 
  end

  def show
  	@event = Event.find_by(id: params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :date)	
    end

    def sign_in
      redirect_to signin_path, notice: "Sign in to create Event" unless logged_in?
    end
end
