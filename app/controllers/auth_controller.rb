require 'dry-validation'

class AuthController < ApplicationController
	skip_before_action :verify_authenticity_token

	def signin
		if request.method == 'POST'
			schema = Dry::Validation.Schema do
				required(:email).filled(:str?)
				required(:password).filled(:str?)
			end

			errors = schema.call(params)
			puts params
			puts errors.success?
			puts errors.errors

		end

		render layout: "site"
	end
end
