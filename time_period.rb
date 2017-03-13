class TimePeriod
	attr_accessor :hour_start, :hour_end

	def initialize(hour_start, hour_end)
		@hour_start = hour_start
		@hour_end = hour_end
	end

	def is_on_period(hour)
		if hour >= @hour_start and hour <= @hour_end then
			true
		else
			false
		end
	end
end
