class Sticker < ApplicationRecord
  belongs_to :member
  validates :sticker_number, uniqueness: true
end
