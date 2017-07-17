class AddDescriptionAuthorIdToCourseTable < ActiveRecord::Migration
  def change
    add_column :courses, :description, :text
    add_column :courses, :author_id, :integer
  end
end
