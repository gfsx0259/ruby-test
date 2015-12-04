class Item < ActiveRecord::Base
  validates :price, {numericality: {greater_than: 0, allow_nil: false} }
  validates :name, presence: true
  validates :description, presence: true
  has_many :positions
  has_many :carts, through: :positions
end
