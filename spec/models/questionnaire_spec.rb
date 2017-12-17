require 'spec_helper'

describe Questionnaire do
  describe '#questions' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
    end

    it 'questionnaire has many question' do
      questionnaire = Questionnaire.find(1)
      questions = questionnaire.questions
      expect(questions.count).to eq 1
      expect(questions.first).to eq @question
    end
  end

  describe '#respondents' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
    end

    it 'questionnaire has many respondents' do
      questionnaire = Questionnaire.find(1)
      respondents = questionnaire.respondents
      expect(respondents.count).to eq 1
      expect(respondents.first).to eq @respondent
    end
  end
end
