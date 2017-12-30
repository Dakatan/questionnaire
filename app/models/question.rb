class Question < ApplicationRecord
  before_create :initialize_no
  after_destroy :destroy_organize_no

  belongs_to :questionnaire
  has_many :answers

  validates :title, presence: true
  validates :question_type, presence: true

  def prev
    @prev ||= Question.find_by(questionnaire_id: questionnaire_id, no: no.to_i - 1)
  end

  def next
    @prev ||= Question.find_by(questionnaire_id: questionnaire_id, no: no.to_i + 1)
  end

  private

  def initialize_no
    max_no_question = self.questionnaire.questions.order(no: 'DESC').limit(1).first
    self_no = max_no_question.present? ? max_no_question.no + 1 : 1
    self.no = self_no
  end

  def destroy_organize_no
    greater_no_questions = self.questionnaire.questions.where(Question.arel_table[:no].gt(self.no))
    greater_no_questions.each do |question|
      question.no = question.no - 1
      question.save
    end
  end
end
