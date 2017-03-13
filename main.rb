require_relative 'predictor.rb'

plate = ARGV[0]
date = ARGV[1]
hour = ARGV[2]

predictor = Predictor.new(plate, date, hour)

if predictor.can_drive then
	puts "YES, YOU CAN"
else
	puts "NOPE, YOU CAN'T"
end


