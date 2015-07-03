class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :words, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :options, through: :answers, dependent: :destroy

  validates :user_id, presence: true
  validates :course_id, presence: true
end
