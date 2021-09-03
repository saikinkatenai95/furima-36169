class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemcondition
  belongs_to :deliveryfee
  belongs_to :prefecture
  belongs_to :readtime
  
  
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
  validates :image
  validates :name
  validates :info
  validates :price
end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[0-9]+\z/}
  
  with_options numericality: { other_than: 1 , message: "can't be blank" } do
  validates :category_id
  validates :itemcondition_id
  validates :deliveryfee_id
  validates :readtime_id
  validates :prefecture_id
  end

end
