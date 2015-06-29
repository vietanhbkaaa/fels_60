class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :options, dependent: :destroy
  has_many :lessons, through: :options

  validates :content, presence: true

  scope :wrong_answers, ->{where(correct: false).order("RANDOM()").limit(3)}
  scope :correct_answer, ->{order("RANDOM()").find_by correct: true}
end
