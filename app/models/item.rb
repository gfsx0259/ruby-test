class Item < ActiveRecord::Base
  validates :price, {numericality: {greater_than: 0, allow_nil: false} }
  validates :name, presence: true
  validates :description, presence: true
end
