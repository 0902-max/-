class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :google_calendar_event, foreign_key: true
      t.string :message
      t.datetime :notified_at
      t.string :status

      t.timestamps
    end
  end
end
