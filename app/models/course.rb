class Course < ActiveRecord::Base
  belongs_to :categorie
  belongs_to :university
  has_many :course_tag_pivots
  has_many :tags , :through => :course_tag_pivots
  has_many :course_user_pivots
  has_many :users , :through => :course_user_pivots

  validates :name , presence: true, length: { maximum: 20 }
  validates :description , presence: true
  validates :university_id, presence: true
  validates :categorie_id, presence: true



end
