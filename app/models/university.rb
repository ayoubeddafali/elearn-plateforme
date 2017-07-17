class University < ActiveRecord::Base
  has_many :courses
  def to_s
    name.capitalize
  end
end
