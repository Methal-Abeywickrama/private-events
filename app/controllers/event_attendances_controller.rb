class EventAttendancesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    puts 'yay'
    p @event

    @event_attendance = @event.event_attendances.build(attendee: current_user)
    if @event_attendance.save
      redirect_to @event, notice: 'You have successfully registered for the event.'
    else
      redirect_to @event, alert: 'Unable to register for the event.'
    end
  end

  def index
    puts 'fuck'
    @event_attendances = EventAttendance.all # or however you want to fetch event attendances
  end
end
