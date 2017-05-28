FactoryGirl.define do
  factory :questionnaire do
    id 1
    title 'Title'
    start_date Date.yesterday
    end_date Date.tomorrow
  end
end
