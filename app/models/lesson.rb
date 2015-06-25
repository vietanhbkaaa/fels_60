class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :words, dependent: :destroy
  has_many :options, dependent: :destroy
  has_many :answers, through: :options, dependent: :destroy

  validates :user_id, presence: true
  validates :course_id, presence: true
end
