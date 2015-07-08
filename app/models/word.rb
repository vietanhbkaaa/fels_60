class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :course
  has_many :options, dependent: :destroy
  has_many :answers

  accepts_nested_attributes_for :options, reject_if: lambda{|a| a[:content].blank?}, allow_destroy: true

  validates :content, presence: true

  scope :get_all, ->user{}
  scope :learned, ->user{
    where "id IN (SELECT word_id FROM answers WHERE option_id is not null AND lesson_id IN (
      SELECT id FROM lessons WHERE user_id = (?)))", user.id}
  scope :not_learned, ->user{
    where "id IN (SELECT word_id FROM answers WHERE option_id is null AND lesson_id IN (
      SELECT id FROM lessons WHERE user_id = (?)))", user.id}

  def print_options
    options.wrong_options.push(options.correct_option).shuffle
  end
end
