class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :memo

  validates_uniqueness_of :user_id, uniqueness: { scope: :memo_id }
end
