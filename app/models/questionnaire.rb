class Questionnaire < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :respondents, dependent: :destroy
end
