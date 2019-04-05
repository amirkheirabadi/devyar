require 'dry-validation'
require 'validation'
require 'helper'
require 'bcrypt'

class AuthController < ApplicationController
	layout "auth"
	skip_before_action :verify_authenticity_token  

	def signin
		if request.method != "GET"
			schema = Dry::Validation.Schema do
				required(:email).filled(:str?)
				required(:password).filled(min_size?: 6, max_size?: 15)
			end
			result = schema.call(params)
			if !result.success?
				flash[:error_messages] = Validation::messages(result.messages)

				return redirect_to '/auth'
			end

			user = User.where(email: params[:email]).take
			unless user
				flash[:error_messages] = ['کاربری با این مشخصات در سیستم یافت نشد .']
				return redirect_to '/auth'
			end

			hashedPassword = BCrypt::Password.new(user.password)
			if hashedPassword != params[:password]
				flash[:error_messages] = ['رمز عبور وارد شده صحیح نمی باشد .']
				return redirect_to '/auth'
			end

			request.session[:user_id] = user.id
			# session[:user_id] = user.id

			return redirect_to '/dashboard'
		end
	end

	def signup
		if request.method != "GET"
			schema = Dry::Validation.Schema do
				required(:email).filled(:str?)
				required(:password).filled(min_size?: 6, max_size?: 15).confirmation
			end

			result = schema.call(params)
			if result.success?
				verify = Verification.where(email: params[:email]).take
				if !verify
					verify = Verification.new
					verify.email = params[:email]
				end
	
				verify.code = Helper.randomCode
				verify.password = BCrypt::Password.create(params[:password])
				verify.save
	
				flash[:success_messages] = ['برای فعال سازی حساب کاربر لطفا ایمیل خود را بررسی نمایید .']
	
				return redirect_to '/auth/confirmation/' + params[:email]
			end

			flash[:error_messages] = Validation::messages(result.messages)
			redirect_to '/auth/signup'
		end
	end

	def verification
		schema = Dry::Validation.Schema do
			required(:email).filled(:str?)
			required(:password).filled(min_size?: 6, max_size?: 15).confirmation
		end

		result = schema.call(params)

		if result.success?
			flash[:error_messages] = ['خطا در داده های ارسالی لطفا مجدد در سیستم ثبت نام کنید .']
			return redirect_to '/auth/signup'
		end

		verify = Verification.where(email: params[:email]).take
		if !verify
			user = User.where(email: params[:email]).take
			if user
				flash[:error_messages] = ['شخصی به وسیله این ایمیل قبلا در سیستم ثبت نام کرده است .']
				return redirect_to '/auth'		
			else
				flash[:error_messages] = ['این ایمیل در سیستم ثبت نشده است .']
				return redirect_to '/auth/signup'		
			end
		end

		user = User.new
		user.email = verify.email
		user.password = verify.password
		user.status = 'active'
		user.save
		
		session[:user_id] = user.id

		flash[:success_messages] = ['حساب کاربری شما با موفقیت فعال شد .']
		return redirect_to '/dashboard'
	end

	def signout
		request.session[:user_id] = false
		request.session[:current_user] = false

		return redirect_to '/auth'
	end
end
