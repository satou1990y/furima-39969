class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city,  :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      purchase = Purchase.create(item_id: item_id, user_id: user_id)
      Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number,purchase_id: purchase.id)
    end
end

