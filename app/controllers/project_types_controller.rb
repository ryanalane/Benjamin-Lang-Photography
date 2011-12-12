class ProjectTypesController < ApplicationController
  def show
  	@type = ProjectType.find_by_url_name(params[:proj_type_url_name])
  	@projs = @type.projects
  end

end
