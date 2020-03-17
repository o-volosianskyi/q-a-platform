Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :questions
  resources :answers, defaults: { format: 'js' }
  get '/' => 'welcome#index'
  get '/answers/:id', to: 'answers#show', defaults: { format: 'js' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
