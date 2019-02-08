class CreditsController < ApplicationController
  layout  "session", only: [:index]
  before_action :item_set, only: [:create]
   def new

   end
   
   def index
   
   end

   def create
      price = item.price 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      charge = Payjp::Charge.create(

         amount: price,
         card:  params['payjp-token'],
         currency: 'jpy',
      )
   end

   private

   def item_set
     item = Item.find(params[:id])
   end
end
