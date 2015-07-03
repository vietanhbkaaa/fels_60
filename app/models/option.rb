class Option < ActiveRecord::Base
  belongs_to :word
  has_one :answer

  validates :word_id, presence: true
  validates :content, presence: true

  scope :wrong_options, ->{where(correct: false).order("RANDOM()").limit(3)}
  scope :correct_option, ->{order("RANDOM()").find_by correct: true}
end
