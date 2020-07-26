Rails.application.routes.draw do
  resources :payment_requests
  resources :tokens, only: [:create]
end
