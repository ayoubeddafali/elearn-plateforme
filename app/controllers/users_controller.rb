class UsersController < ApplicationController
  layout '/layouts/form.html.erb'
  before_action :authenticate_user!


end