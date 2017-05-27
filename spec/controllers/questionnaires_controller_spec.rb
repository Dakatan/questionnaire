require 'spec_helper'

describe QuestionnairesController do

  describe 'before create questionnaire test' do
    before do
      @questionnaire = create(:questionnaire)
    end

    describe 'GET #index' do
      it 'can access to questionnaires' do
        get :index
        expect(response).to have_http_status :success
      end

      it 'template is index' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      it 'assigns the requested questionnaire as @questionnaire' do
        get :show, params: {id: @questionnaire}
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :show, params: {id: @questionnaire}
        expect(response).to have_http_status :success
      end

      it 'template is show' do
        get :show, params: {id: @questionnaire}
        expect(response).to render_template :show
      end
    end

    describe 'GET #result' do
      it 'assigns the requested questionnaire as @questionnaire' do
        get :result, params: {id: @questionnaire}
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :result, params: {id: @questionnaire}
        expect(response).to have_http_status :success
      end

      it 'template is finish' do
        get :result, params: {id: @questionnaire}
        expect(response).to render_template :result
      end
    end

    describe 'GET #finish' do
      it 'http status is success' do
        get :finish
        expect(response).to have_http_status :success
      end

      it 'template is finish' do
        get :finish
        expect(response).to render_template :finish
      end
    end

    describe 'GET #new' do
      it 'assigns a new questionnaire as @questionnaire' do
        get :new
        expect(response).to have_http_status :success
      end

      it 'template is new' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it 'assigns the requested questionnaire as @questionnaire' do
        get :edit, params: {id: @questionnaire}
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'http status is success' do
        get :edit, params: {id: @questionnaire}
        expect(response).to have_http_status :success
      end

      it 'template is edit' do
        get :edit, params: {id: @questionnaire}
        expect(response).to render_template :edit
      end
    end

    describe 'PUT #update' do
      it 'assigns the requested questionnaire as @questionnaire' do
        questionnaire_params = attributes_for(:questionnaire, title: 'changed')
        put :update, params: {id: @questionnaire, questionnaire: questionnaire_params}
        expect(assigns(:questionnaire)).to eq @questionnaire
      end

      it 'redirect to show' do
        questionnaire_params = attributes_for(:questionnaire, title: 'changed')
        put :update, params: {id: @questionnaire, questionnaire: questionnaire_params}
        expect(response).to have_http_status :redirect
      end

      it 'update is success' do
        questionnaire_params = attributes_for(:questionnaire, title: 'changed')
        put :update, params: {id: @questionnaire, questionnaire: questionnaire_params}
        @questionnaire.reload
        expect(@questionnaire.title).to eq 'changed'
      end
    end

    describe 'DELETE #destroy' do
      it 'destroys the requested questionnaire' do
        expect {
          delete :destroy, params: {id: @questionnaire}
        }.to change(Questionnaire, :count).by(-1)
      end

      it 'redirect to index' do
        delete :destroy, params: {id: @questionnaire}
        expect(response).to have_http_status :redirect
      end
    end
  end

  describe 'POST #create' do
    it 'creates a new Questionnaire' do
      expect {
        post :create, params: {questionnaire:  attributes_for(:questionnaire)}
      }.to change(Questionnaire, :count).by(1)
    end

    it 'redirect to show' do
      post :create, params: {questionnaire:  attributes_for(:questionnaire)}
      expect(response).to have_http_status :redirect
    end
  end
end
