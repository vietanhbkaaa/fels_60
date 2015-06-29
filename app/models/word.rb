class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
  has_many :answers, dependent: :destroy

  validates :content, presence: true

  def print_answers
    answers.wrong_answers.push(answers.correct_answer).shuffle
  end
end