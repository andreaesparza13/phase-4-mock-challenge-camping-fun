class SignupsController < ApplicationController

   def create 
      signup = Signup.create!(signup_parms)
      render json: signup.activity, status: :created
   end

   private

   def signup_parms
      params.permit(:time, :camper_id, :activity_id)
   end

end
