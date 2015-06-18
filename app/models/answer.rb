class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :options, dependent: :destroy
  has_many :lessons, through: :options

  validates :content, presence: true
end
