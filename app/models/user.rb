class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
  validates :lastname
  validates :firstname
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
  validates :lastname_japanese, presence: true
  validates :firstname_japanese, presence: true
  end
  validates :birthday, presence: true  
  validates :password, length: { minimum: 6},format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  has_many :items
  has_many :buys
end
