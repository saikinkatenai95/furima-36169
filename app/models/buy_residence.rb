class BuyResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :build_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :address, :user_id, :item_id, :token
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Include hyphen(-)"}
  end
  
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

    def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, build_name: build_name, phone_number: phone_number, buy_id: buy.id)
    end
    
end