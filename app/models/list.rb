class List < ApplicationRecord
  belongs_to :user
  #リストを削除した時にそれに関するカードも削除する
  has_many :cards, dependent: :destroy
  validates :title, length: { in: 1..255 }
end
