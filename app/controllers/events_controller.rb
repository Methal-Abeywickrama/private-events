class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :relevant_creator, only: [:edit, :destroy]

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

  def destroy
    puts 'what event'
    @event = Event.find_by(id: params[:id])
    if @event.destroy
      redirect_to events_url, notice: 'Event was successfully deleted.'
    else
      redirect_to events_url, alert: 'Event could not be deleted'
    end
  end


  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  def update
    @event = Event.find_by(id: params[:id])
    
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated"
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :details, :location, :date, :private)
  end

  def relevant_creator
    @event = Event.find_by(id: params[:id])
    unless @event.creator_id == current_user.id
      flash[:alert] = "Permission denied"
      redirect_to root_path
    end
  end
end
