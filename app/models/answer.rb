class Answer < ActiveRecord::Base
  belongs_to :word
  belongs_to :option
  belongs_to :lesson

  validates :lesson_id, presence: true

end