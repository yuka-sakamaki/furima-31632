class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :days_to_ship

  belongs_to :user
  has_many   :comments
  has_one_attached :image
  has_one :order
  has_many :item_tag_relations, dependent: :destroy
  has_many :tags, through: :item_tag_relations

  with_options presence: true do
    validates :name, :explanation, :category_id, :condition_id, :postage_payer_id, :prefecture_code_id, :days_to_ship_id, :image, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :category_id, :condition_id, :postage_payer_id, :days_to_ship_id, numericality: { other_than: 1 }
   end

   after_create do
    item = Item.find_by(id: id)
    tags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(tag_name: tag.downcase.delete('#'))
      item.tags << tag
    end

    before_update do
      item = Item.find_by(id: id)
      tags = hashname.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      tags.uniq.map do |tag|
        tag = Tag.find_or_create_by(tag_name: tag.downcase.delete('#'))
        item.tags << tag
      end
  end

end
