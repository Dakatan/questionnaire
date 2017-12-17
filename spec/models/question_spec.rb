require 'spec_helper'

describe Question do
  describe '#prev' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question has prev' do
      prev_question = create(:question)
      question = create(:question, id: 2, no: 2)
      expect(question.prev).to eq prev_question
    end

    it 'question does not have prev' do
      question = create(:question)
      expect(question.prev).to eq nil
    end
  end

  describe '#next' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question has next' do
      question = create(:question)
      next_question = create(:question, id: 2, no: 2)
      expect(question.next).to eq next_question
    end

    it 'question does not have next' do
      question = create(:question)
      expect(question.next).to eq nil
    end
  end

  describe '#answers' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'question has many answer' do
      question = Question.find(1)
      answers = question.answers
      expect(answers.count).to eq 1
      expect(answers.first).to eq @answer
    end
  end

  describe '#questionnaire' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
    end

    it 'question has many questionnaire' do
      question = Question.find(1)
      questionnaire = question.questionnaire
      expect(questionnaire).to eq @questionnaire
    end
  end
end
