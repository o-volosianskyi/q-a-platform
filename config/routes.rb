Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}
  resources :users
  resources :questions
  get '/answers/delete' => 'answers#delete_answer', defaults: { format: 'js' }
  resources :answers, only: [:new, :create, :update], defaults: { format: 'js' }
  delete '/answers/:id' => 'answers#destroy'
  get '/' => 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
