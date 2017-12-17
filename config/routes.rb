Rails.application.routes.draw do
  root to: 'questionnaires#index'
  get 'questionnaires/finish' => 'questionnaires#finish', as: 'finish_questionnaire'
  get 'questionnaires/:id/result' => 'questionnaires#result', as: 'result_questionnaire'
  resources :questionnaires do
    resources :questions do
	    resources :answers, only: [:create, :update]
	  end
  end
end
