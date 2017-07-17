class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
    render layout:'/layouts/master.html.erb'
  end
  def get_category
    @categorie = Categorie.find(params[:Categorie])
    redirect_to new_category_course_path(@categorie)
  end
end
