class RemoveAuthorIdFromCourseTable < ActiveRecord::Migration
  def change
    remove_column :courses, :author_id
  end
end
