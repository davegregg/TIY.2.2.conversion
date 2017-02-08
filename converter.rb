# A class to convert units of measurement
# To use: Converter.new(32).f_to_c == 0
require 'pry'
require 'tty'

class Converter
  attr_accessor :number

  def initialize(number)
    @number = number.to_f.round(3)
  end

  class << self

    attr_accessor :number

    def c_to_f
     # Multiply by 9, then divide by 5, then add 32
     # For instance, 12C == 53.6F
     number * 9 / 5 + 32
    end

    def f_to_c
      # Deduct 32, then multiply by 5, then divide by 9
      # For instance, 23F == -5C
      (number - 32) * 5 / 9
    end

    def quarts_to_cups
      # Four cups in a quart
      # So, 2 quarts == 8 cups
      number * 4
    end

    def cups_to_quarts
      number / 4
    end

    def inches_to_feet
      number / 12
    end

    def feet_to_inches
      number * 12
    end

    def seconds_to_milliseconds
      # 1000 milliseconds per second
      number * 1000
    end

    def milliseconds_to_seconds
      number / 1000
    end

    def feet_to_miles
      # A mile is 5280 feet
      # So, 13200 feet == 2.5 miles
      number / 5280
    end

    def miles_to_feet
      number * 5280
    end

    def feet_to_meters
      # A meter is 3.28084 feet
      # So, A mile == 1609.344 meters (when rounded to three decimals)
      (number / 3.28084).round(3)
    end

    def meters_to_feet
      number * 3.28084
    end

    def ounce_to_gram
      # One ounce == 28.3495 grams
      number * 28.3495
    end

    def gram_to_ounce
      number / 28.3495
    end

    def days_to_year
      number / 365.25
    end

    def year_to_days
      number * 365.25
    end

    def julian_week_to_nirn_week
      number * 7 / 10
    end

    def nirn_week_to_julian_week
      number * 10 / 7
    end

  end

  def method_missing(methd, *args, &block)

    self.class.number = number.to_f.round(3)
    self.class.send(methd).round(3)

  end

end

#print Converter.new(33).f_to_c

prompt = TTY::Prompt.new
options = { 'Celsius' => 'c',
            'Fahrenheit' => 'f',
            'quarts' => 'quarts',
            'cups' => 'cups',
            'inches' => 'inches',
            'feet' => 'feet',
            'seconds' => 'seconds',
            'milliseconds' => 'milliseconds',
            'miles' => 'miles',
            'meters' => 'meters',
            'ounces' => 'ounce',
            'grams' => 'gram',
            'days' => 'days',
            'years' => 'year',
            'weeks' => 'julian_week',
            'tendays' => 'nirn_week' }
unit_conversions = {  'c' => ['f'],
                      'f' => ['c'],
                      'quarts' => ['cups'],
                      'cups' => ['quarts'],
                      'inches' => ['feet'],
                      'feet' => ['inches','miles','meters'],
                      'seconds' => ['milliseconds'],
                      'milliseconds' => ['seconds'],
                      'miles' => ['feet'],
                      'meters' => ['feet'],
                      'ounce' => ['gram'],
                      'gram' => ['ounce'],
                      'days' => ['year'],
                      'year' => ['days'],
                      'julian_week' => ['nirn_week'],
                      'nirn_week' => ['julian_week'] }

origin_unit = prompt.select("Hey boo. What unit would you like to convert?", options)

puts "Construct method name: #{origin_unit}_to_#{unit_conversions[origin_unit][0]}"

if unit_conversions[origin_unit].count == 1
  target_unit = unit_conversions[origin_unit].first
  number_to_convert = prompt.ask("I can convert #{options.key(origin_unit)} into #{options.key(target_unit)}. Give me a value to convert:\n")
else
  target_unit = prompt.select("And what unit would you like to convert #{options.key(origin_unit)} into?", unit_conversions[origin_unit])
  number_to_convert = prompt.ask("Okay! Give me a value in #{options.key(origin_unit)} to convert into #{options.key(target_unit)}:\n")
end

result = Converter.new(number_to_convert).send("#{origin_unit}_to_#{target_unit}".to_sym)

puts "Okay! #{number_to_convert} #{options.key(origin_unit)} is equal to #{result} #{options.key(target_unit)}!"

#binding.pry
