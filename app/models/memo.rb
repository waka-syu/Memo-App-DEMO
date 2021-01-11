class Memo < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :content
    validates :genre_id, numericality: { other_than: 1, message: "を選んでください" }
  end
end
