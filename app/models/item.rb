class Item < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :price
  end
end
