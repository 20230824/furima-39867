FactoryBot.define do
  factory :order_shipping do
    post { '123-4567' }
    prefecture_id { 2 }
    village { '八潮市' }
    explanation { '八潮 1-1' }
    building { 'パークハイツ' }
    telephone { '01201233906' }
    token { 'tok_aaaaaaaaaaa00000000000000000' }
  end
end