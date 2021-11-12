class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :detail
end
