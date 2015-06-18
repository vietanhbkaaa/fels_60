class Option < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :answer

  validates :lesson_id, presence: true
  validates :answer_id, presence: true
end
