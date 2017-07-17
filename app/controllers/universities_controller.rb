class UniversitiesController < ApplicationController
  before_action :authenticate_user!, :require_an_admin
  def create
      @university  = University.new(university_params)
      if  @university.save
        flash[:success] = "University Created Successfully"
        redirect_to categories_path
      else
        render root_url
      end
  end


  private
  def university_params
    params.require(:university).permit(:name)
  end
  def require_an_admin
    if current_user.role != "admin"
      redirect_to root_path
    end
  end
end
