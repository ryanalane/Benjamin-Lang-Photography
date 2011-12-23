class PhotosController < ApplicationController
  def show
  	@projects = ProjectType.find_by_url_name(params[:proj_type_url_name]).projects
  	@project = @projects.find_by_url_name(params[:project_url_name])
  	@photo = @project.photos.find_by_display_order(params[:photo_display_order].to_i)
  	
  end

end
