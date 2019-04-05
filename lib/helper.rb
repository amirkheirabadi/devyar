module Helper
	def Helper.randomCode
		r = Random.new
		r.rand(100000...999999)
	end
end