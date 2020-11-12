class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :days_to_ship 

has_one :purchase
belongs_to :user
has_many   :comments
has_one_attached :image

validates :name, :explanation, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :days_to_ship_id, :image, presence: true
validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
validates :category_id, :condition_id, :postage_payer_id, :days_to_ship_id, numericality: { other_than: 1 }
end
