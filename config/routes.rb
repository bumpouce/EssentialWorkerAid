Rails.application.routes.draw do
  resources :kudos
  root to: 'sessions#index'
  
  get "worker_sign_in" => "sessions#worker_sign_in"
  post "worker_sign_in" => "sessions#worker_login"
  get "worker_signed_out" => "sessions#worker_signed_out"
  get "new_worker" => "workers#new"

  get "supporter_sign_in" => "sessions#supporter_sign_in"
  get "supporter_signed_out" => "sessions#supporter_signed_out"
  get "new_supporter" => "supporters#new"
  post "supporter_sign_in" => "sessions#supporter_login"

  get "logout" => "sessions#destroy"
  get "remove_kudo" => "kudos#destroy"

  resources :supporters
  resources :workers
  resources :request_responses
  resources :financial_requests

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
