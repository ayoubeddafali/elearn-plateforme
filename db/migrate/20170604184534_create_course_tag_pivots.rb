class CreateCourseTagPivots < ActiveRecord::Migration
  def change
    create_table :course_tag_pivots do |t|
      t.integer :course_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end
