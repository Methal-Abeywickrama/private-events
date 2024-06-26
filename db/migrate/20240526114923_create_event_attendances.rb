class CreateEventAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendances do |t|
      t.references :users, null: false, foreign_key: true
      t.references :events, null: false, foreign_key: true

      t.timestamps
    end
  end
end
