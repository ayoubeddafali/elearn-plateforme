class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_a_teacher, :only => [:new, :create]

  layout '/layouts/master.html.erb'
  def index
    @categorie = Categorie.find(params[:category_id])
    @courses = @categorie.courses.paginate(:page => params[:page], :per_page => 6)
    render layout:'/layouts/master.html.erb'
  end
  def show
    @course = Course.find(params[:id])
    @teachers = @course.users.where(role: 'teacher')
    #render layout:'/layouts/master.html.erb'
  end
  def new
    @cat = Categorie.find(params[:category_id]) || Categorie.find(params[:categorie_id])
    @course = Course.new
  end
  def create
    @course = Course.new(params[:course].permit(:name, :description, :categorie_id, :university_id, :url))
    if @course.save
      flash[:success] = "Course has been created successfully"
      CourseUserPivot.create(user_id: current_user.id, course_id: @course.id)
      redirect_to category_course_path(@course.categorie.id, @course.id)
    else
      render 'new'
    end

  end
  def add_like
    @id = params[:id]
    new_rating = Course.find(@id).rating  + 1
    puts Course.find(@id).update(rating: new_rating)

  end
  def add_dislike
    @id = params[:id]
    new_rating = Course.find(@id).rating  - 1
    puts Course.find(@id).update(rating: new_rating)

  end


  private
  def require_a_teacher
    if  current_user.role != "teacher"
      redirect_to root_path
    end
  end

end
