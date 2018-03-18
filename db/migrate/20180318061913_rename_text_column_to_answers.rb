class RenameTextColumnToAnswers < ActiveRecord::Migration[5.1]
  def up
    rename_column :answers, :text, :json_text
  end

  def down
    rename_column :answers, :json_text, :text
  end
end
