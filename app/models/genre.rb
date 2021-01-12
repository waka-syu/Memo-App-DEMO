class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '教育' },
    { id: 3, name: '政治・経済' },
    { id: 4, name: '商業・工業' },
    { id: 5, name: '国際' },
    { id: 6, name: 'IT' },
    { id: 7, name: '語学' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: '学校' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :memos
end
