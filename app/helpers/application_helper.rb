module ApplicationHelper
  def customize_the_navbar
    controller_name == 'home' ? "bg-dark-img home-1" : ""
  end
end
