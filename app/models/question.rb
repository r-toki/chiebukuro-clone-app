class Question < ApplicationRecord

  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :content, presence: true

  attr_accessor :resolved

  def set_resolved
    self.resolved = self.answers.where(best: true).count == 1
  end

end
