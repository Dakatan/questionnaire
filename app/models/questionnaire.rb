class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :respondents, dependent: :destroy

  validates :title, presence: true
  validates :start_date, presence: true, format: /\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])*/
  validates :end_date, presence: true, format: /\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])*/
end
