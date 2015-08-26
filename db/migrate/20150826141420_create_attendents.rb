class CreateAttendents < ActiveRecord::Migration
  def change
    create_table :attendents do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id
      t.timestamps
    end
  end
end
