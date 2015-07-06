class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :user_id, presence: true
  validates :course_id, presence: true

  before_create :set_words

  def num_correct_answers
    answers.select{|answer| answer.option.correct? unless answer.option.nil?}.count
  end

  private
  def set_words
    words = course.words.order("RANDOM()").limit Settings.per_lesson
    words.each{|word| answers.build word: word}
  end
end
