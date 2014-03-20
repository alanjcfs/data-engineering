class Purchaser < ActiveRecord::Base
  has_many :items_purchasers
  has_many :items, through: :items_purchasers
end
