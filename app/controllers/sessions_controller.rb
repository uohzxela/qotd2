class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			flash[:info] = "Welcome back " << user.name
			redirect_to user
			#redirect_to root_path
		else
			flash.now[:danger] = 'Invalid email/password combination.'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
