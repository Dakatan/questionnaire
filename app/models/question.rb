class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers

  def prev
    @prev ||= Question.find_by(questionnaire_id: self.questionnaire_id, no: self.no - 1)
  end

  def next
    @prev ||= Question.find_by(questionnaire_id: self.questionnaire_id, no: self.no + 1)
  end
end
