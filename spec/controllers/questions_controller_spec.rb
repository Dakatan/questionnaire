require 'spec_helper'

describe QuestionsController do
  before do
    @questionnaire = create(:questionnaire)
  end

  describe 'before create question' do
    before do
      @question = create(:question)
    end

    describe 'GET #index' do
      it 'assigns all questions as @questionnaire' do
        get :index, params: { questionnaire_id: @questionnaire.id }
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :index, params: { questionnaire_id: @questionnaire.id }
        expect(response).to have_http_status :success
      end

      it 'template is index' do
        get :index, params: { questionnaire_id: @questionnaire.id }
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      it 'assigns the requested question as @question' do
        get :show, params: { questionnaire_id: @questionnaire.id, id: @question.id }
        expect(assigns(:question)).to eq @question
      end

      it 'assigns the requested question as @questionnaire' do
        get :show, params: { questionnaire_id: @questionnaire.id, id: @question.id }
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :show, params: { questionnaire_id: @questionnaire.id, id: @question.id }
        expect(response).to have_http_status :success
      end

      it 'template is show' do
        get :show, params: { questionnaire_id: @questionnaire.id, id: @question.id }
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it 'assigns the requested question as @questionnaire' do
        get :new, params: { questionnaire_id: @questionnaire.id }
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :new, params: { questionnaire_id: @questionnaire.id }
        expect(response).to have_http_status :success
      end

      it 'template is new' do
        get :new, params: { questionnaire_id: @questionnaire.id }
        expect(response).to render_template :new
      end
    end
  end
end
