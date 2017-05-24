class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :respondent_id, null: false
      t.integer :question_id, null: false
      t.text :text, limit: 65535

      t.timestamps
    end
  end
end
