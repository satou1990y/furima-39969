class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :item_id
    validates :user_id
  end
end
