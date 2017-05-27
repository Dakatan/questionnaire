# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    id 1
    respondent_id 1
    question_id 1
    text 'Text'
  end
end
