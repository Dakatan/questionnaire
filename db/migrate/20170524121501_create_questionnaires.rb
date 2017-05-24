class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.string :title, limit: 255, null: false
	  t.date :start_date, null: false
	  t.date :end_date, null: false

      t.timestamps
    end
  end
end
