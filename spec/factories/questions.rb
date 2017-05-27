# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
	id 1
	questionnaire_id 1
	no 1
	title 'Title'
	question_type 'Type'
	text 'Text'
  end
end
