class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/}
  validates :nickname, presence: true
  validates :birthday, presence: true
end