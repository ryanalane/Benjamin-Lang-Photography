class ProjectsController < ApplicationController
  def show
  	@type = ProjectType.find_by_url_name(params[:proj_type_url_name])
  	@project = @type.projects.find_by_url_name(params[:project_url_name])
  end

end
