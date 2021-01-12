class Memo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre

  has_many :fovorites, dependent: :destroy

  with_options presence: true do
    validates :title
    validates :content
    validates :genre_id, numericality: { other_than: 1, message: "を選んでください" }
  end

end
