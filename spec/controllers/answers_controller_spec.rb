require 'spec_helper'

describe AnswersController do
  before do
    @questionnaire = create(:questionnaire)
    @question = create(:question)
    @respondent = create(:respondent)
  end

  describe 'POST #create' do
    it 'creates a new Answer' do
      expect do
        post :create, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, answer: attributes_for(:answer) }
      end.to change(Answer, :count).by(1)
    end

    it 'assigns all questions as @questionnaire' do
      post :create, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, answer: attributes_for(:answer) }
      expect(assigns(:questionnaire)).to eq @questionnaire
    end

    it 'assigns the requested question as @question' do
      post :create, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, answer: attributes_for(:answer) }
      expect(assigns(:question)).to eq @question
    end
  end

  describe 'PUT #update' do
    before do
      @answer = create(:answer)
    end

    it 'assigns all questions as @questionnaire' do
      answer_params = attributes_for(:answer, json_text: 'changed')
      put :update, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, id: @answer.id, answer: answer_params }
      expect(assigns(:questionnaire)).to eq @questionnaire
    end

    it 'assigns the requested question as @question' do
      answer_params = attributes_for(:answer, json_text: 'changed')
      put :update, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, id: @answer.id, answer: answer_params }
      expect(assigns(:question)).to eq @question
    end

    it 'assigns the requested question as @answer' do
      answer_params = attributes_for(:answer, json_text: 'changed')
      put :update, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, id: @answer.id, answer: answer_params }
      expect(assigns(:answer)).to eq @answer
    end

    it 'update is success' do
      answer_params = attributes_for(:answer, json_text: 'changed')
      put :update, params: { questionnaire_id: @questionnaire.id, question_id: @question.id, id: @answer.id, answer: answer_params }
      @answer.reload
      expect(@answer.json_text).to eq 'changed'
    end
  end
end
