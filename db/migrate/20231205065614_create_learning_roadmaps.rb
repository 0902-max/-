class CreateLearningRoadmaps < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_roadmaps do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :google_calendar_event, foreign_key: true

      t.timestamps
    end
  end
end
