class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_an_admin, only: [:delete_course, :delete_user]
  layout '/layouts/master.html.erb'
  def index
    if current_user.role == "admin"
      @courses = Course.all
    elsif current_user.role == "teacher"
      @courses = CourseUserPivot.where(user_id: current_user.id).pluck(:course_id).map{ |c| Course.find(c) }
    end
  end

  def delete_course
    Course.find(params[:id]).delete
    redirect_to  settings_path
  end
  def delete_user
    User.find(params[:id]).delete
    redirect_to  settings_users_path

  end
  def delete_university
    University.find(params[:id]).delete
    redirect_to settings_universities_path
  end
  def users
    @users = User.all
  end
  def universities
    @universities = University.all
  end

  def require_an_admin
    if  current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end
end
