#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'converter'

class ConverterTest < MiniTest::Test

  def test_c_to_f
   # Multiply by 9, then divide by 5, then add 32
   # For instance, 12C == 53.6F
   #((number * 9)/5) + 32
   number = 12.to_f
   assert number * 9 / 5 + 32 == 53.6
  end

  def test_f_to_c
    # Deduct 32, then multiply by 5, then divide by 9
    # For instance, 23F == -5C
    #((number - 32) * 5)/9
    number = 23.to_f
    assert (number - 32) * 5 / 9 == -5
  end

  def test_quarts_to_cups
    # Four cups in a quart
    # So, 2 quarts == 8 cups
    number = 2.to_f
    assert number * 4 == 8
  end

  def test_cups_to_quarts
    number = 8.to_f
    assert number / 4 == 2
  end

  def test_inches_to_feet
    number = 24.to_f
    assert number / 12 == 2
  end

  def test_feet_to_inches
    number = 2.to_f
    assert number * 12 == 24
  end

  def test_seconds_to_milliseconds
    # 1000 milliseconds per second
    number = 2.to_f
    assert number * 1000 == 2000
  end

  def test_milliseconds_to_seconds
    number = 2000.to_f
    assert number / 1000 == 2
  end

  def test_feet_to_miles
    # A mile is 5280 feet
    # So, 13200 feet == 2.5 miles
    number = 10560.to_f
    assert number / 5280 == 2
  end

  def test_miles_to_feet
    number = 2.to_f
    number * 5280 == 10560
  end

  def test_feet_to_meters
    # A meter is 3.28084 feet
    # So, A mile == 1609.344 meters (when rounded to three decimals)
    number = 1.to_f
    assert (number / 3.28084).round(3) == 0.305
  end

  def test_meters_to_feet
    number = 1.to_f
    assert number * 3.28084 == 3.28084
  end

  def test_ounce_to_gram
    # One ounce == 28.3495 grams
    number = 1.to_f
    assert number * 28.3495 == 28.3495
  end

  def test_gram_to_ounce
    number = 1.to_f
    assert (number / 28.3495).round(3) == 0.035
  end

  def test_days_to_year
    number = 1461.to_f
    assert number / 365.25 == 4
  end

  def test_year_to_days
    number = 4.to_f
    assert number * 365.25 == 1461
  end

  def test_julian_week_to_skyrim_week
    number = 1.to_f
    assert number * 7 / 10 == 0.7
  end

  def test_skyrim_week_to_julian_week
    number = 7.to_f
    assert number * 10 / 7 == 10
  end

end
