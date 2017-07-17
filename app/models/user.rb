class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :course_user_pivots
  has_many :courses, :through => :course_user_pivots

  VALID_EMAIL = /[a-zA-Z0-9._-]{1,}+@[a-zA-Z0-9]{1,}+.[a-zA-Z]{2,}/
  validates :email, presence: true , length:{ maximum: 30} ,format: { with: VALID_EMAIL},
            uniqueness: { case_insensitive: false }


  def to_s
    username
  end
end
