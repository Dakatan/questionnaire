class Question < ApplicationRecord
  before_create :initialize_no
  after_destroy :destroy_organize_no

  belongs_to :questionnaire
  has_many :answers

  validates :title, presence: true
  validates :question_type, presence: true, inclusion: { in: Settings.question[:types_map].keys.map{|i| i.to_s} }
  validates :json_text, presence: true
  validate :json_array_lint

  def prev
    Question.find_by(questionnaire_id: questionnaire_id, no: no.to_i - 1)
  end

  def next
    Question.find_by(questionnaire_id: questionnaire_id, no: no.to_i + 1)
  end

  def final?
    self.next.blank?
  end

  def first?
    prev.blank?
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

  def json_array_lint
    begin
      json = JSON.parse(json_text)
      unless json.instance_of?(Array)
        errors.add(:json_text, '形式が正しくないか不正な文字が含まれています')
      end
    rescue JSON::ParserError => e
      errors.add(:json_text, '形式が正しくないか不正な文字が含まれています')
    end
  end
end
