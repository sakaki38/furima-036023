class Order < ApplicationRecord
  belongs_to :buy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end
