class FixEventAttendancesColumnNames < ActiveRecord::Migration[7.1]
  def change
    rename_column :event_attendances, :users_id, :attendee_id
    rename_column :event_attendances, :events_id, :attended_event_id
  end
end
