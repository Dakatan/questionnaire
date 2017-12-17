require 'spec_helper'

describe QuestionnairesController do
  describe 'routing' do
    before do
      @questionnaire = create(:questionnaire)
    end

    it 'routes to #index' do
      expect(get: '/questionnaires')
        .to route_to(controller: 'questionnaires', action: 'index')
    end

    it 'routes to #index' do
      expect(get: root_path)
        .to route_to(controller: 'questionnaires', action: 'index')
    end

    it 'routes to #show' do
      expect(get: ['/questionnaires/', @questionnaire.id].join)
        .to route_to(controller: 'questionnaires', action: 'show', id: '1')
    end

    it 'routes to #show' do
      expect(get: questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/questionnaires/new')
        .to route_to(controller: 'questionnaires', action: 'new')
    end

    it 'routes to #new' do
      expect(get: new_questionnaire_path)
        .to route_to(controller: 'questionnaires', action: 'new')
    end

    it 'routes to #create' do
      expect(post: '/questionnaires')
        .to route_to(controller: 'questionnaires', action: 'create')
    end

    it 'routes to #create' do
      expect(post: questionnaires_path)
        .to route_to(controller: 'questionnaires', action: 'create')
    end

    it 'routes to #finish' do
      expect(get: '/questionnaires/finish')
        .to route_to(controller: 'questionnaires', action: 'finish')
    end

    it 'routes to #finish' do
      expect(get: finish_questionnaire_path)
        .to route_to(controller: 'questionnaires', action: 'finish')
    end

    it 'routes to #show' do
      expect(get: ['/questionnaires/', @questionnaire.id].join)
        .to route_to(controller: 'questionnaires', action: 'show', id: '1')
    end

    it 'routes to #show' do
      expect(get: questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/edit'].join)
        .to route_to(controller: 'questionnaires', action: 'edit', id: '1')
    end

    it 'routes to #edit' do
      expect(get: edit_questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'edit', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: ['/questionnaires/', @questionnaire.id].join)
        .to route_to(controller: 'questionnaires', action: 'destroy', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'destroy', id: '1')
    end

    it 'routes to #update' do
      expect(patch: ['/questionnaires/', @questionnaire.id].join)
        .to route_to(controller: 'questionnaires', action: 'update', id: '1')
    end

    it 'routes to #update' do
      expect(patch: questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'update', id: '1')
    end

    it 'routes to #result' do
      expect(get: ['/questionnaires/', @questionnaire.id, '/result'].join)
        .to route_to(controller: 'questionnaires', action: 'result', id: '1')
    end

    it 'routes to #result' do
      expect(get: result_questionnaire_path(@questionnaire))
        .to route_to(controller: 'questionnaires', action: 'result', id: '1')
    end
  end
end
