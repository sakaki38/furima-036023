class BuyOrder 
  include ActiveModel::Model
  attr_accessor :area_id, :city, :address, :phone_number, :user_id, :item_id, :post_code, :building_name

  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Not Include hyphen(-)"}
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Order.create(address: address, post_code: post_code, area_id: area_id, city: city, phone_number: phone_number, building_name: building_name, buy_id: buy.id)
  end
end