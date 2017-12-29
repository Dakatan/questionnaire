class AddActiveToQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :active, :boolean, null: false, default: true
  end
end
