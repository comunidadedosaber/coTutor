Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  #get '/login', to: 'home#login'
  #get '/register', to: 'home#register'

  #resources :users
  #get '/user/:id/projects', to: 'users#index_projects'
  #get '/:id/dashboard', to: 'users#dashboard'

  resources :projects
  get '/project/:id/preview', to: 'projects#preview'

  resources :projects_members
  get '/project/:id/members', to: 'projects#index_members'
  get '/project/:id/members/new', to: 'projects#create_member'

  resources :projects_boards
  get '/project/:id/boards', to: 'projects#index_boards'
  get '/project/:id/boards/new', to: 'projects#create_board'

  resources :projects_keywords
  get '/project/:id/keywords', to: 'projects#index_keywords'
  get '/project/:id/keywords/new', to: 'projects#create_keyword'

  resources :projects_suggestions
  get '/project/:id/suggestions', to: 'projects#index_suggestions'
  get '/project/:id/suggestions/new', to: 'projects#create_suggestion'

  resources :projects_archives
  get '/project/:id/archives', to: 'projects#index_archives'
  get '/project/:id/archives/new', to: 'projects#create_archive'

  resources :projects_proposals
  get '/project/:id/proposals', to: 'projects#index_proposals'
  get '/project/:id/proposals/new', to: 'projects#create_proposal'

  resources :projects_drafts
  get '/project/:id/drafts', to: 'projects#index_drafts'
  get '/project/:id/drafts/new', to: 'projects#create_draft'

  resources :projects_monographs
  get '/project/:id/monographs', to: 'projects#index_monographs'
  get '/project/:id/monographs/new', to: 'projects#create_monograph'

end
