Rails.application.routes.draw do
  root to: 'questionnaire#index'
  get 'questionnaire/finish' => 'questionnaire#finish', as: 'finish_questionnaire'
  get 'questionnaire/:id/result' => 'questionnaire#result', as: 'result_questionnaire'
  resources :questionnaire do
    resources :question, only: :show
  end
  resources :question, only: :show do
    resources :answer, only: [:create, :update]
  end
end
