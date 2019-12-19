Rails.application.routes.draw do
  root to: 'index#tests'

  resources :users, only: :create

  get :signup, to: 'users#new'

  resources :tests do
    resources :questions, shallow: true, except: %i[index] do
      resources :answers, shallow: true, except: %i[index]
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
