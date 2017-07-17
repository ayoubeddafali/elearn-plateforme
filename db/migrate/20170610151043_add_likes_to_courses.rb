class AddLikesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :rating, :integer, default: 0
  end
end
