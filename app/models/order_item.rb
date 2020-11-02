class OrderItem

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンを含め且つ７桁の数字を入力してください"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "半角数字11桁以内で入力してください"}
    validates :phone_number, length: { maximum: 11 }
  end

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  DeliveryAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order: order)
  end
end