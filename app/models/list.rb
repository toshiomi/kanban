class List < ApplicationRecord
  belongs_to :user
  has_many :cards
  validates :title, length: { in: 1..255 }
end
