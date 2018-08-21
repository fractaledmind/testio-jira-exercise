Rails.application.routes.draw do
  namespace :jira do
    resources :users, only: %i[new create]
    resources :projects, only: %i[index]
    resources :issues, only: %i[new create]
  end
end
