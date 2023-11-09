FactoryBot.define do
  factory :purchase_address do
    postcode      { '123-4567'}
    prefecture_id { Faker::Number.within(range: 2..48)}
    city          { '横浜市緑区' }
    block         { '青山1-1-1' }
    building      { '柳ビル103' }
    phone_number  { '09012345678' }
    item_id       { 2 }
    user_id       { 2 }
    
  end
end
