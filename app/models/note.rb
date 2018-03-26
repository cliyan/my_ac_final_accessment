class Note < ApplicationRecord

  validates :post, presence: true

  belongs_to :user
  has_many :likes
  
end
