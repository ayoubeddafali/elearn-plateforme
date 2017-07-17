class CreateCourseUserPivots < ActiveRecord::Migration
  def change
    create_table :course_user_pivots do |t|
      t.integer :course_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
