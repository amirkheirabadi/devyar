class HomeController < ApplicationController
	def index
	
		render "index"
	end

	def category

		render template: "categories/#{params[:name]}"
	end
end
