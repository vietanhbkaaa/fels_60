class Answer < ActiveRecord::Base
  belongs_to :word
  belongs_to :option
  belongs_to :lesson
  delegate :user, to: :lesson

end
