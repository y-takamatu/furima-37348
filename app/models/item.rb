class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :transport_day
  belongs_to :user
  has_one_attached :image


  with_options numericality: { other_than: 1  , message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :delivery_charge 
    validates :prefecture
    validates :transport_day
  end
end
