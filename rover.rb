class Rover
	attr_accessor :x, :y, :heading

	def initialize(plateau)
		@plateau = plateau
	end

	# validating params
	def valid?
		permitted_headings = %w(N E S W)

		if @x.class == Fixnum && 
			 @y.class == Fixnum &&
			 permitted_headings.include?(@heading)
			 
			 return true
		end
			
		false
  end

	# moving through the path
	def move(path)
		path.each_char do |direction|
			case direction
				when 'M' then forward
				when 'R', 'L' then turn(direction)
				else next
			end
		end
	end

	private
		# turning right or left depending on direction and current heading
		def turn(direction)
			case @heading
				when 'N' then @heading = (direction == 'L') ? 'W' : 'E'
				when 'E' then @heading = (direction == 'L') ? 'N' : 'S'
				when 'S' then @heading = (direction == 'L') ? 'E' : 'W'
				when 'W' then @heading = (direction == 'L') ? 'S' : 'N'
				else return
			end
		end

		# move forward
		def forward
			x, y = @x, @y

			case @heading
				when 'N' then y += 1
				when 'E' then x += 1
				when 'S' then y -= 1
				when 'W' then x -= 1
				else return
			end

      unless outside_of_plateau?(x, y)
        @x, @y = x, y
      end

		end

    def outside_of_plateau?(x, y)
      return true if x > @plateau.x || x < 0 || y > @plateau.y || y < 0
      false
    end
end









