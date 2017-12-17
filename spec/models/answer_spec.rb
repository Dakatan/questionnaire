require 'spec_helper'

describe Answer do
  describe '#question' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'answer belongs to question' do
      answer = Answer.find(1)
      question = answer.question
      expect(question).to eq @question
    end
  end

  describe '#respondent' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'answer belongs to question' do
      answer = Answer.find(1)
      respondent = answer.respondent
      expect(respondent).to eq @respondent
    end
  end
end
