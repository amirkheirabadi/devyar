module Validation
	def Validation.messages(msg)
		results = []
		msg.each do |key, array|
			results += array
		end

		return results
	end
end