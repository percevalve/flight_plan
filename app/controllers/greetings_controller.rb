class GreetingsController < ApplicationController
  def index
	
  end

   def require_token
   	@token = params["token"]
   	if !cookies.include?(:token) and cookies[:token] != "aaa" and @token != "aaa"
   		redirect_to greetings_index_path
   	end
   end
end
