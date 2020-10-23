class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to :user, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください'}
    validates :price, numericality: {greater_than_or_equal_to: 300,less_than: 9999999, message: '¥300〜9,999,999円で入力してください'}
  end
end
