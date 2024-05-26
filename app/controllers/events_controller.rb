class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index 
    @events = Event.all 
  end

  def new 
    @event = Event.new
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event.nil?
      redirect_to events_path, alert: "Event not found"
    end
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      puts 'neega'
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
