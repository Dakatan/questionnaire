class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :respondents, dependent: :destroy

  VALID_DATE_FORMAT = /\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])*/
  validates :title, presence: true
  validates :start_date, presence: true, format: VALID_DATE_FORMAT
  validates :end_date, presence: true, format: VALID_DATE_FORMAT
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, '開始日以降を入力してください')
    end
  end
end
