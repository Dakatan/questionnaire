require 'spec_helper'

describe Respondent do
  describe '#questionnaire' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'respondent belongs to questionnaire' do
      respondent = Respondent.find(1)
      questionnaire = respondent.questionnaire
      expect(questionnaire).to eq @questionnaire
    end
  end

  describe '#answers' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'respondent has many answers' do
      respondent = Respondent.find(1)
      answers = respondent.answers
      expect(answers.count).to eq 1
      expect(answers.first).to eq @answer
    end
  end
end
