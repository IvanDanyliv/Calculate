module TimeService
  class BaseTime
    def initialize(&block)
      instance_eval(&block) if block_given?
    end

    def parse_time(time_str)
      hour, minute, period = time_str.match(/(\d{1,2}):(\d{2})\s*(AM|PM)/i).captures
      hour = hour.to_i
      minute = minute.to_i
      period = period.upcase
      [hour, minute, period]
    end

    def format_time(hour, minute, period)
      "#{hour}:#{format('%02d', minute)} #{period}"
    end
  end

  class TimeCalculator < BaseTime
    def add_minutes_to_time(time_str, minutes)
      hour, minute, period = parse_time(time_str)

      hour += 12 if period == 'PM' && hour != 12
      hour = 0 if period == 'AM' && hour == 12

      total_minutes = hour * 60 + minute + minutes

      new_hour = (total_minutes / 60) % 24
      new_minute = total_minutes % 60

      new_period = new_hour >= 12 ? 'PM' : 'AM'
      new_hour = new_hour % 12
      new_hour = 12 if new_hour == 0

      format_time(new_hour, new_minute, new_period)
    end

    def self.add_minutes(time_str, minutes)
      new.add_minutes_to_time(time_str, minutes)
    end
  end
end

if __FILE__ == $0
  if ARGV.length == 2
    time_str = ARGV[0]
    minutes = ARGV[1].to_i
    result = TimeService::TimeCalculator.add_minutes(time_str, minutes)
    puts result
  else
    puts "Usage: ruby script_name.rb 'HH:MM AM/PM' minutes"
  end
end
