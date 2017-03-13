require_relative '../time_period.rb'
require 'test/unit'

class TimePeriodTest < Test::Unit::TestCase
	def test_is_on_period
		assert_equal(true, TimePeriod.new("07:00", "09:30").is_on_period("08:30"))
		assert_equal(false, TimePeriod.new("07:00", "09:30").is_on_period("20:30"))
	end
end
