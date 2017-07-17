class CreateCourseCategoriePivots < ActiveRecord::Migration
  def change
    create_table :course_categorie_pivots do |t|
      t.integer :course_id
      t.integer :categorie_id
      t.timestamps null: false
    end
  end
end
