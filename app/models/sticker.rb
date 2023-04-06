class Sticker < ApplicationRecord
  include Discard::Model

  belongs_to :member
  before_save :sticker_uniquesness

  private

  def sticker_uniquesness
    Sticker.where(discarded_at: nil).pluck(:sticker_number).include?(sticker_number)
  end
end
