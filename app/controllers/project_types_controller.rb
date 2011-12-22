class ProjectTypesController < ApplicationController
  def show
  	@projects = ProjectType.find_by_url_name(params[:proj_type_url_name]).projects
  end

end
