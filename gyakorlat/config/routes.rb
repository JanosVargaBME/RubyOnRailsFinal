Rails.application.routes.draw do
  post 'sessions/create', to: 'sessions#create', as: 'login'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'welcome/index'
  root 'welcome#index'
  resources :semesters
  resources :semestersubjects
  resources :subjects
  resources :resources
  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create'
  get 'users/edit/:id', to: 'users#edit', as: 'edit_profile'
  put 'users/update', to: 'users#update', as: 'update_profile'
  get 'users/show/:id', to: 'users#show', as: 'profile'
  get 'users/forgotten'
  post 'users/send_forgotten'
  #Semesters oldallal kapcsolatos route-ok
  get 'semesters/new'
  post 'semesters/create'
  get 'semesters/edit'
  put 'semesters/update'
  delete 'semesters/:id', to: 'semesters#destroy', as: 'destroy_semesters'
  get 'semesters/show/:id', to: 'semesters#show', as: 'show_semesters'
  #Semestersubject oldallal kapcsolatos route-ok
  get 'semestersubjects/new'
  post 'semestersubjects/create'
  #get 'semestersubjects/edit', to: 'semestersubjects#edit', as: 'edit_semestersubject'
  put 'semestersubjects/update'
  delete 'semestersubjects/:id', to: 'semestersubjects#destroy', as: 'destroy_semestersubjects'
  get 'semestersubjects/show/:id', to: 'semestersubjects#show', as: 'show_semestersubjects'
  #Subject oldallal kapcsolatos route-ok
  get 'subjects/new'
  post 'subjects/create'
  get 'subjects/edit'
  put 'subjects/update'
  delete 'subjects/:id', to: 'subjects#destroy', as: 'destroy_subject'
  get 'subjects/show/:id', to: 'subjects#show', as: 'show_subject'
  resources :items
  get 'subjects/page/:page', to: 'subjects#index', as: 'subjects/page'
  get 'semestersubjects/page/:page', to: 'semestersubjects#index', as: 'semestersubjects/page'
  get 'semesters/page/:page', to: 'semesters#index', as: 'semesters/page'
  get 'say/hello', to: 'say#hello', as: 'hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
