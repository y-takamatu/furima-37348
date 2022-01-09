class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :transport_day
  belongs_to :user
  has_one_attached :image
   
  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  

  with_options numericality: { other_than: 1  , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id 
    validates :prefecture_id
    validates :transport_day_id
  end
end
