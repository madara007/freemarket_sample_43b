class CreditsController < ApplicationController
  layout  "session", only: [:index]

   def new

   end
   
   def index
   
   end

   def create
      item = Item.find(params[:id])
      price = item.price 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      charge = Payjp::Charge.create(
      :amount => price,
      :card => params['payjp-token'],
      :currency => 'jpy',

      )
   end
end
