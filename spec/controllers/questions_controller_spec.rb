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

    describe 'DELETE #destroy' do
      it 'destroys the requested question' do
        expect do
          delete :destroy, params: { questionnaire_id: @questionnaire.id, id: @question }
        end.to change(Question, :count).by(-1)
      end

      it 'redirect to index' do
        delete :destroy, params: { questionnaire_id: @questionnaire.id, id: @question }
        expect(response).to have_http_status :redirect
      end
    end


    describe 'PUT #update' do
      it 'assigns the requested questionnaire as @question' do
        question_params = attributes_for(:question, title: 'changed')
        put :update, params: { questionnaire_id: @questionnaire.id, id: @question, question: question_params }
        expect(assigns(:question)).to eq @question
      end

      it 'redirect' do
        question_params = attributes_for(:question, title: 'changed')
        put :update, params: { questionnaire_id: @questionnaire.id, id: @question, question: question_params }
        expect(response).to have_http_status :redirect
      end

      it 'update is success' do
        question_params = attributes_for(:question, title: 'changed')
        put :update, params: { questionnaire_id: @questionnaire.id, id: @question, question: question_params }
        @question.reload
        expect(@question.title).to eq 'changed'
      end
    end
  end

  describe 'POST #create' do
    it 'post request data question will be save' do
      expect do
        post :create, params: { questionnaire_id: @questionnaire.id, question: attributes_for(:question) }
      end.to change(Question, :count).by(1)
    end

    it 'redirect to show' do
      post :create, params: { questionnaire_id: @questionnaire.id, question: attributes_for(:question) }
      expect(response).to have_http_status :redirect
    end
  end
end
