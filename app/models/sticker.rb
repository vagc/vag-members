class Sticker < ApplicationRecord
  belongs_to :member
  validates :member_id, uniqueness: true
  validates :sticker_number, uniqueness: true
end
