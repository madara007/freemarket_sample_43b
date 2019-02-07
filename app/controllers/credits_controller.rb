class CreditsController < ApplicationController
  layout  "session", only: [:index]

   def new

   end
   
   def index
   
   end

   def create
      
      items = Item.find(parmas[:id])
      price = items.price
      Payjp.api_key = "sk_test_63fca0d2e14f02caa7fb939d"
      charge = Payjp::Charge.create(
      :amount => price,
      :card => params['payjp-token'],
      :currency => 'jpy',

      )
   end
end
