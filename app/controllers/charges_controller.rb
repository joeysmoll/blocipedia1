class ChargesController < ApplicationController
 def create
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 5_00,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
   current_user.premium!
   flash[:notice] = "#{current_user.email}, enjoy your premium membership!"
   redirect_to user_path(current_user)
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end
 
 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 5_00
   }
 end
 
 def downgrade
    current_user.standard!
    current_user.wikis.update_all(private: false)
    flash[:notice] = "You are now downgraded to a free account."
     redirect_to root_path
 end
 
end
