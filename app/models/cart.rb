class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :positions
  has_many :items, through: :positions

  def total
   self.positions.sum(:quantity)
  end

  def quantity item
    self.positions.find_by_item_id(item.id).quantity
  end
end
