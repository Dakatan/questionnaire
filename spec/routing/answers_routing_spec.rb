require 'spec_helper'

describe AnswersController do
  describe 'routing' do

	  before do
	    @questionnaire = create(:questionnaire)
	    @question = create(:question)
      @respondent = create(:respondent)
      @answer = create(:answer)
	  end

    it 'routes to #create' do
      expect(post: ['/questionnaires/', @questionnaire.id, '/questions/', @question.id, '/answers'].join)
	    .to route_to(controller: 'answers', action: 'create', questionnaire_id: '1', question_id: '1')
    end

    it 'routes to #create' do
      expect(post: questionnaire_question_answers_path(@questionnaire, @question))
	    .to route_to(controller: 'answers', action: 'create', questionnaire_id: '1', question_id: '1')
    end

    it 'routes to #update' do
      expect(patch: ['/questionnaires/', @questionnaire.id, '/questions/', @question.id, '/answers/', @answer.id].join)
	    .to route_to(controller: 'answers', action: 'update', questionnaire_id: '1', question_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(patch: questionnaire_question_answer_path(@questionnaire, @question, @answer))
	    .to route_to(controller: 'answers', action: 'update', questionnaire_id: '1', question_id: '1', id: '1')
    end
  end
end
