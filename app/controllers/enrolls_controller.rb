class EnrollsController < ApplicationController
  layout '/layouts/master.html.erb'
  before_action :authenticate_user!
  def add
    CourseUserPivot.create(course_id: params[:course_id], user_id: params[:user_id])
    redirect_to category_course_path(Course.find(params[:course_id]).categorie.id, params[:course_id])
  end

  def user_courses
    @mycourses_ids = CourseUserPivot.where(user_id: params[:user_id]).pluck(:course_id)
    @results = @mycourses_ids.map { |course_id| Course.find(course_id) }
    @results = @results.paginate(:page => params[:page], :per_page => 3)
  end


end
