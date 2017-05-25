class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :questionnaire_id, null: false
	  t.integer :no, null: false
      t.string :title, limit: 255, null: false
      t.string :type, limit: 255, null: false
      t.text :text, limit: 65535

      t.timestamps
    end
  end
end
