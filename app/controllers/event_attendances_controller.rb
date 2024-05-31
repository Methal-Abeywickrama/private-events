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

  def destroy
    puts 'info'
    p params
    @event_attendance = EventAttendance.find_by(attendee_id: params[:id], attended_event_id: params[:event_id])
    puts 'event is'
    p @event_attendance
    puts 'events are'
    p EventAttendance.all
    if @event_attendance.destroy
      redirect_to user_path, notice: 'Attendance deleted succussfully'
    else  
      redirect_to user_path, alert: 'Attendance deletion unsuccessfull'
    end
  end

  def index
    puts 'fuck'
    @event_attendances = EventAttendance.all # or however you want to fetch event attendances
  end

end
