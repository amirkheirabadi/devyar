class HomeController < ApplicationController
	def index
		render plain: "404 Not Found", status: 404
	end
end
