class Order < ApplicationRecord
  
  belongs_to :item  
  has_one :shipping  
  belongs_to :user 
end
