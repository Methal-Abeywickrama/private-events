class EventsController < ApplicationController
  
  def index 
    @events = Event.all 
  end

  def new 
    @event = Event.new
  end

  def create
    @event = current_user.Event.build(event_params)
    if @event.save
      redirect_to @event, notice: "The event was successfully created "
    else  
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :details, :location, :date)
  end
end
