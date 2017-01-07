require_relative 'plateau'
require_relative 'rover'

# outputting rovers positions
def output(rovers)
  rovers.each { |rover| puts "#{rover.x} #{rover.y} #{rover.heading}" }
  abort
end

plateau = Plateau.new

# get valid plateau
until plateau.valid? do
	puts 'Please enter plateau size (numbers in format \'x y\'):'
	x, y = gets.chomp.split(' ')
	plateau.x = x.to_i.abs
	plateau.y = y.to_i.abs
end

rovers = []

# deploying and moving rovers
while true
	rover = Rover.new(plateau)

	# deploying rover correctly
	until rover.valid?
		puts 'Please enter rover\'s start position (format \'x y heading\'). If you want to finish - type \'FINISH\'.'
    input = gets.chomp

    output(rovers) if input == 'FINISH'

    x, y, heading = input.split(' ')
		rover.x = x.to_i.abs
		rover.y = y.to_i.abs
		rover.heading = heading&.upcase
	end

	# moving rover
	puts 'Please enter rover\'s path. If you want to finish - type \'FINISH\'.'
  input = gets.chomp

  output(rovers) if input == 'FINISH'

	rover.move(input.upcase)
	rovers << rover
end