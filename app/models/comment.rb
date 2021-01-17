class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :memo

  validates :content, presence: true
end
