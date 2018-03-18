class RenameTextColumnToQuestions < ActiveRecord::Migration[5.1]
  def up
    rename_column :questions, :text, :json_text
  end

  def down
    rename_column :questions, :json_text, :text
  end
end
