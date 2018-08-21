Rails.application.routes.draw do
  namespace :jira do
    resources :users, only: %i[new create]
  end
  namespace :jira do
    resources :projects
  end
  namespace :jira do
    resources :issues
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
