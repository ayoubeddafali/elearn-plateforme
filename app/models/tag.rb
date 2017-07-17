class Tag < ActiveRecord::Base
  has_many  :course_tag_pivots
  has_many :courses, :through => :course_tag_pivots
end
