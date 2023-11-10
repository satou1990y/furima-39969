class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :period
  belongs_to :status
  belongs_to :prefecture

  validates :item_name,     presence: true
  validates :description,   presence: true
  validates :price,         presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,         presence: true

  validates :category_id, :status_id, :charge_id, :prefecture_id, :period_id,
            numericality: { other_than: 1, message: "can't be blank" }
            
end
