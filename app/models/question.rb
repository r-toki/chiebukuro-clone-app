class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one :best_answer

  validates :title, presence: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }

end
