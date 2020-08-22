class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question

  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }

end
