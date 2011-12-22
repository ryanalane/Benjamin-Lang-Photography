class PhotosController < ApplicationController
  def show
  	@projects = ProjectType.find_by_url_name(params[:proj_type_url_name]).projects
  	@project = @projects.find_by_url_name(params[:project_url_name])
  	
  end

end
