class AddUrlToCoursesTable < ActiveRecord::Migration
  def change
    add_column :courses, :url, :string, default: "https://www.youtube.com/watch?v=XHakl2bMQYI"
  end
end
