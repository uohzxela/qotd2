class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def show
		@user = User.find(params[:id])
	end
	def create
		@user = User.new(user_params)
		if @user.save
			#sign_in @user
			flash[:success] = "Welcome to QOTD, man."
			redirect_to @user
		else
			flash.now[:danger] = "Damn it, you suck brah."
			render 'new'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
