class CreateGoogleCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :google_calendar_events do |t|
      t.references :user, foreign_key: true
      t.string :google_event_id
      t.string :title
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
