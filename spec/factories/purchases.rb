FactoryBot.define do
  factory :purchase do
    item_id { 2 }
    user_id { 2 }  
    
    association :item
    association :user
  end
end
