require 'date'

require_relative 'schedule.rb'
require_relative 'time_period.rb'

class Predictor
	attr_accessor :schedules, :plate, :date, :hour

	def initialize(plate, date, hour)
		time_periods = [TimePeriod.new('07:00','09:30'), TimePeriod.new('16:00','19:30')]

		monday = 1
		tuesday = 2
		wednesday = 3
		thursday = 4
		friday = 5

		@schedules = Array.new

		@schedules.push(Schedule.new(monday, time_periods, [1, 2]))
		@schedules.push(Schedule.new(tuesday, time_periods, [3, 4]))
		@schedules.push(Schedule.new(wednesday, time_periods, [5, 6]))
		@schedules.push(Schedule.new(thursday, time_periods, [7, 8]))
		@schedules.push(Schedule.new(friday, time_periods, [9, 0]))

		@plate = plate
		@date = Date.parse(date)
		@hour = hour
	end

	def can_drive
		@schedules.select {|s| s.day == @date.wday and s.last_digits.include? @plate[-1].to_i}.each do |schedule|
			if schedule.time_periods.select { |t| t.is_on_period(@hour) }.length > 0 then
				return false
			end
		end

		true
	end
end

