class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :transport_day
  has_one_attached :image
  has_one :order
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price
  end

  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300〜9,999,999の間で入力してください' }
 
  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :transport_day_id
  end
end
