FactoryBot.define do
  factory :item do
    association :user          
    title { 'ペン' }        
    description { 'すらすらかける' }    
    price { '1234' }           
    category_id { '2' }    
    condition_id { '2' }    
    shipping_cost_id { '2' }
    prefecture_id { '2' }  
    today_id { '2' }  
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
