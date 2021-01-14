class Memo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre

  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :content
    validates :genre_id, numericality: { other_than: 1, message: "を選んでください" }
  end

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
