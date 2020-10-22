class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :deliverycharge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliveryday
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
    validates :genre_id, numericality: { other_than: 1 } 
  end
end
