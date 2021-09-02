class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemcondition
  belongs_to :deliveryfee
  belongs_to :prefecture
  belongs_to :readtime
  
  
  belongs_to :user
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :itemcondition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :deliveryfee_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }
  validates :readtime_id, numericality: { other_than: 1 , message: "can't be blank" }
end
