class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :items_purchasers
  has_many :purchasers, through: :items_purchasers
end
