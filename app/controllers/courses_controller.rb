class CoursesController < ApplicationController
  before_action :signed_in_user

  def show
  	@course = Course.find_by id: params[:id]
  end
end
