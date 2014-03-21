class ItemsPurchaser < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchaser

  delegate :price, to: :item
end
