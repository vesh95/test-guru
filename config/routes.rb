Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus,
    path_names: { sign_in: :login, sign_out: :logout },
    controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
  end
end
