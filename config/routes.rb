Rails.application.routes.draw do
  resources :all_subject_roles
  resources :subject_roles do 
    get 'getSubjectRoles', on: :collection
  end
  resources :academic_years
  resources :privileges
  resources :user_roles
  resources :roles
  resources :users
  resources :student_numbers
  resources :groups
  
  resources :ensembles do
    post "create_record", on: :collection
    get "getCurrentEnsemble", on: :collection
    get "documents", on: :collection
    get "downloadEnsemble", on: :collection
    get "statistics", on: :collection
    get "uncoveredSubjects", on: :collection
    get "teacherTasks", on: :collection
  end

  resources :departments
  resources :subjects do
    get "import_subjects", on: :collection
  end
  resources :teachers do
    get "getTeachers", on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #root 'subjects#new'
end
