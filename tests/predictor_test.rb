require_relative '../predictor.rb'
require 'test/unit'

class PredictorTest < Test::Unit::TestCase
	def setup
		@predictor = Predictor.new("GSL-6585", "15-03-2017", "08:56")
	end

	def test_is_digit_for_weekday
		assert_equal(1, @predictor.schedules.select{|s| s.day == @predictor.date.wday and s.last_digits.include? @predictor.plate[-1].to_i}.length)

		@predictor.plate = "GSL-6586"
		assert_equal(1, @predictor.schedules.select{|s| s.day == @predictor.date.wday and s.last_digits.include? @predictor.plate[-1].to_i}.length)

		@predictor.plate = "GSL-6587"
		assert_equal(0, @predictor.schedules.select{|s| s.day == @predictor.date.wday and s.last_digits.include? @predictor.plate[-1].to_i}.length)
	end

	def test_can_drive 
		assert_equal(false, Predictor.new("GSL-6585", "15-03-2017", "08:56").can_drive)
		assert_equal(true, Predictor.new("GSL-6585", "15-03-2017", "20:56").can_drive)
	end
end
