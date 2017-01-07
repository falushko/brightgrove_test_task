class Plateau
	attr_accessor :x, :y

	# validating params
	def valid?
		if @x.class == Fixnum && 
			 @y.class == Fixnum && 
			 @x != 0 && 
			 @y != 0

			return true
		end
			
		false
	end
end