class OrderShipping
  include ActiveModel::Model
  attr_accessor :post, :village, :explanation, :telephone, :building, :prefecture_id, :item_id, :user_id,:token

  with_options presence: true do
    validates :post, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :village
    validates :explanation
    validates :telephone, format: { with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id:, user_id:)
    Shipping.create(post: post, prefecture_id: prefecture_id, village: village, explanation: explanation,  building: building, telephone: telephone, order_id: order.id)
  end
end