Rails.application.routes.draw do
  #resources :professions
  #resources :neighborhoods
  resources :request_responses
  resources :supporters
  resources :workers
  resources :financial_requests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
