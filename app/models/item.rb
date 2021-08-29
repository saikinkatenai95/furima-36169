class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActuveRecordExtensions
    belongs_to :category
    belongs_to :item_status
    belongs_to :delivery_fee
    belongs_to :prefecture
    belongs_to :read_time

end