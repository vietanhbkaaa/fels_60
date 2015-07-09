class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
  has_many :options, dependent: :destroy
  has_many :answers

  accepts_nested_attributes_for :options, reject_if: lambda{|a| a[:content].blank?}, allow_destroy: true

  validates :content, presence: true

  def print_options
    options.wrong_options.push(options.correct_option).shuffle
  end
end