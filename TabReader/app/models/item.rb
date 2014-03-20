class Item < ActiveRecord::Base
  belongs_to :merchant
  has_and_belongs_to_many :purchasers
end
