Blp::Application.routes.draw do
  get "project_types/show"
  get "projects/show"

  get 'home/index'
  root :to => 'home#index'
  
  resource :project_type
  
 match '/:proj_type_url_name' => 'project_types#show'
 match '/:proj_type_url_name/:project_url_name' => 'projects#show'
  
end
