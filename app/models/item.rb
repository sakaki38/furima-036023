class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :explanation, presence: true
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :detail_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_day_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :detail
  belongs_to :area
  belongs_to :shipping_day
  has_one_attached :image
end
