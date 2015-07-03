class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
  has_many :options, dependent: :destroy
  has_one :answer

  validates :content, presence: true

  def print_options
    options.wrong_options.push(options.correct_option).shuffle
  end
end