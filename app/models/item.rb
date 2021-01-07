class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality:{ greater_than: 300, less_than: 10000000 }, format: {with: /\A[0-9]+\z/}
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :preparation_day_id
  end
end
