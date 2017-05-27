# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :respondent do
    id 1
    questionnaire_id 1
    name 'name'
    status false
  end
end
