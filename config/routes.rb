Blp::Application.routes.draw do
  get "photos/show"

  get "project_types/show"
  get "projects/show"
  get "photos/show"

  get 'home/index'
  root :to => 'home#index'
  
  resource :project_type
  
 match '/:proj_type_url_name' => 'project_types#show'
 match '/:proj_type_url_name/:project_url_name' => 'projects#show'
 match '/:proj_type_url_name/:project_url_name/:photo_display_order/' => 'photos#show'
  
end
