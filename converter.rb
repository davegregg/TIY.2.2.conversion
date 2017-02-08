# A class to convert units of measurement
# To use: Converter.new(32).f_to_c == 0

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

    def julian_week_to_skyrim_week
      number * 7 / 10
    end

    def skyrim_week_to_julian_week
      number * 10 / 7
    end

  end

  def method_missing(methd, *args, &block)

    self.class.number = number.to_f.round(3)
    self.class.send(methd).round(3)

  end

end

# prompt = TTY::Prompt.new
# options = {}
# prompt.select("Hey boo. What unit would you like to convert?", options)
