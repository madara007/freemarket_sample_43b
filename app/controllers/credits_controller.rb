class CreditsController < ApplicationController
  layout  "session", only: [:index]

   def new

   end
   
   def index
   
   end


   def create
      Payjp.api_key = "sk_test_63fca0d2e14f02caa7fb939d"
      charge = Payjp::Charge.create(
      :amount => 3000,
      :card => params['payjp-token'],
      :currency => 'jpy',
      )
   end
end
