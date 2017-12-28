class AddCommentToQuestionnaire < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :comment, :text
  end
end
