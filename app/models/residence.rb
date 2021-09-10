class Residence < ApplicationRecord

  belongs_to :buy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  
end
