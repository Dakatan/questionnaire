require 'spec_helper'

describe Question do
  describe '#prev' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question has prev' do
      prev_question = create(:question)
      question = create(:question, id: 2)
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
      next_question = create(:question, id: 2)
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

  describe '#final?' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question is final' do
      create(:question)
      question = create(:question, id: 2)
      expect(question.final?).to eq true
    end

    it 'question is not false' do
      create(:question)
      question = create(:question, id: 2)
      expect(question.first?).to eq false
    end
  end

  describe '#first?' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question is first' do
      question = create(:question)
      create(:question, id: 2, no: 2)
      expect(question.first?).to eq true
    end

    it 'question is not first' do
      create(:question)
      question = create(:question, id: 2)
      expect(question.first?).to eq false
    end
  end

  describe '#destroy' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'question destroy with remove organization questions' do
      question1 = create(:question)
      question2 = create(:question, id: 2)
      question3 = create(:question, id: 3)
      question4 = create(:question, id: 4)

      expect(question1.no).to eq 1
      expect(question2.no).to eq 2
      expect(question3.no).to eq 3
      expect(question4.no).to eq 4

      question2.destroy

      question1.reload
      question3.reload
      question4.reload

      expect(question1.no).to eq 1
      expect(question3.no).to eq 2
      expect(question4.no).to eq 3
    end
  end

  describe '#json_array_lint' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'json format error' do
      question = Question.new
      question.id = 1
      question.title = 'Title'
      question.question_type = '01'
      question.no = 1
      question.json_text = 'TEST'

      question.valid?

      expect(question.errors.messages[:json_text]).not_to be_empty
    end

    it 'json array format error' do
      question = Question.new
      question.id = 1
      question.title = 'Title'
      question.question_type = '01'
      question.no = 1
      question.json_text = '{"TEST": "TEST"}'

      question.valid?

      expect(question.errors.messages[:json_text]).not_to be_empty
    end
  end

end
