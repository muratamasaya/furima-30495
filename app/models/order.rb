class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to :user
  belongs_to :item
  belongs_to_active_hash :delivery_charge
  has_one :delivery_address
  has_one_attached :image
  
end
