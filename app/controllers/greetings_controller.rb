class GreetingsController < ApplicationController
  
  def index
	
  end

   def require_token
   	@token = params["token"]
   	authorized = ['***REMOVED***','***REMOVED***']
   	if cookies.signed[:token].nil? and cookies.signed[:token] != "aaa" and !authorized.include?(@token)
   		redirect_to greetings_index_path
   	elsif cookies.signed[:token].nil? and authorized.include?(@token)
   		cookies.signed[:token] = { value: @token, :expires => 1.year.from_now}
   	elsif !@token.nil? and !authorized.include?(@token)
   		cookies.delete :token
   	end
   end
end
