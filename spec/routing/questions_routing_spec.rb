require 'spec_helper'

describe QuestionsController do
  describe 'routing' do
    before do
      @questionnaire = create(:questionnaire)
      @question = create(:question)
    end

    it 'routes to #index' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/questions'].join)
        .to route_to(controller: 'questions', action: 'index', questionnaire_id: '1')
    end

    it 'routes to #index' do
      expect(get: questionnaire_questions_path(@questionnaire))
        .to route_to(controller: 'questions', action: 'index', questionnaire_id: '1')
    end

    it 'routes to #show' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/questions/', @question.id].join)
        .to route_to(controller: 'questions', action: 'show', questionnaire_id: '1', id: '1')
    end

    it 'routes to #show' do
      expect(get: questionnaire_question_path(@questionnaire, @question))
        .to route_to(controller: 'questions', action: 'show', questionnaire_id: '1', id: '1')
    end

    it 'routes to #new' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/questions/new'].join)
        .to route_to(controller: 'questions', action: 'new', questionnaire_id: '1')
    end

    it 'routes to #new' do
      expect(get: new_questionnaire_question_path(@questionnaire))
        .to route_to(controller: 'questions', action: 'new', questionnaire_id: '1')
    end

    it 'routes to #create' do
      expect(post: ['/questionnaires/', @questionnaire.id, '/questions/'].join)
        .to route_to(controller: 'questions', action: 'create', questionnaire_id: '1')
    end

    it 'routes to #create' do
      expect(post: questionnaire_questions_path(@questionnaire))
        .to route_to(controller: 'questions', action: 'create', questionnaire_id: '1')
    end

    it 'routes to #edit' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/questions/', @question.id , '/edit'].join)
        .to route_to(controller: 'questions', action: 'edit', questionnaire_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: edit_questionnaire_question_path(@questionnaire, @question))
        .to route_to(controller: 'questions', action: 'edit', questionnaire_id: '1', id: '1')
    end
  end
end
