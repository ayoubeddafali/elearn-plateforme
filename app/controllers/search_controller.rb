class SearchController < ApplicationController
  layout "layouts/master.html.erb"
  def search_for
    @input = params[:input] || "nothing"
    wild_card = "%#{@input}%"
    @results = Course.all.where("name LIKE ?", wild_card)

  end
  def get_result
    @input = params[:input] || "nothing"
    wild_card = "%#{@input}%"
    @results = Course.all.where("name LIKE ?", wild_card)
    render 'search_for'

  end
end
