class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
  has_many :answers, dependent: :destroy
end
