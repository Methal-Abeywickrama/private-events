class AddForeignKeyConstraintsToEventAttendances < ActiveRecord::Migration[7.1]
  def change
    def change
      # Add foreign key constraint for user_id with ON DELETE CASCADE
      add_foreign_key :event_attendances, :users, column: :user_id, on_delete: :cascade
      
      # Add foreign key constraint for event_id with ON DELETE CASCADE
      add_foreign_key :event_attendances, :events, column: :event_id, on_delete: :cascade
    end
  end
end
