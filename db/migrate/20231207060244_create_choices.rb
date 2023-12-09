class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true
      t.text :question
      t.string :user_choice

      t.timestamps
    end
  end
end
