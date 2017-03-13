class Schedule
	attr_accessor :day, :time_periods, :last_digits

	def initialize(day, time_periods, last_digits)
		@day = day
		@time_periods = time_periods
		@last_digits = last_digits
	end
end
