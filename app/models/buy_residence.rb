class BuyResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :build_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :address, :user_id, :item_id
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Include hyphen(-)"}
  end
  
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


end