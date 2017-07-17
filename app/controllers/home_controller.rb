class HomeController < ApplicationController
  layout '/layouts/application.html.erb'
  def index
    @popular_courses = Course.all.order(rating: :desc).limit(6)
  end
  def about
  end
  def contact
  end

end
