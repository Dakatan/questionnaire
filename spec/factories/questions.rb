FactoryGirl.define do
  factory :question do
    id 1
    questionnaire_id 1
    no 1
    title 'Title'
    question_type '01'
    json_text '["A","B","C"]'
  end
end
