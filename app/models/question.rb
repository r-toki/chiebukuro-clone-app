class Question < ApplicationRecord

  belongs_to :user
  has_many :answers

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

end
