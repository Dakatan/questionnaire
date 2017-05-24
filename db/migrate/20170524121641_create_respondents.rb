class CreateRespondents < ActiveRecord::Migration[5.1]
  def change
    create_table :respondents do |t|
      t.integer :questionnaire_id, null: false
      t.string :uuid, limit: 36
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
