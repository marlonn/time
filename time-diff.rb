# coding: utf-8

=begin
inspiration:
  http://stackoverflow.com/questions/2310197/how-to-convert-270921sec-into-days-hours-minutes-sec-ruby
  https://gist.github.com/shunchu/3175001
  https://ruby-doc.org/core-1.9.3/Time.html
probleme:
  - in marlon-Virtualbox werden die Stunden nicht korrekt ausgegeben:

  How many days until ...
  (enter time, date or datetime in ISO 8601-format, e.g. 2016-08-29)
  2016-10-10
  41 days 996 hours 26 minutes 9 seconds until 2016-10-10 00:00
  marlon@marlon-VirtualBox /media/marlon/DATAPUPPY/_marneu/workspace-ruby/time $ irb
  1.9.3-p551 :001 > Time.now
   => 2016-08-29 11:35:20 +0200

=end

require 'time'

def formatted_duration total_seconds
  days    =   ( total_seconds / (60*60*24)        ).floor
  hours   = ( ( total_seconds / (60*60) ) % 24    ).floor
  minutes = ( ( total_seconds / 60 ) % 60         ).floor
  seconds =   ( total_seconds % 60                ).floor

  "#{days} days #{ hours } hours #{ minutes } minutes #{ seconds } seconds"
end

puts "\n----------------------------------------------------------------------\n"

puts "Specify start time:  (press enter to use current time)"
start = gets.chomp
puts "How many days until ..."
puts "(enter time, date or datetime in ISO 8601-format, e.g. 2016-08-29)"
t_end = gets.chomp

t_end = Time.parse(t_end)
unless start == ""
  t_start = Time.parse(start)
  puts formatted_duration(seconds_until) + " between #{t_start.strftime("%F %H:%M")} and #{t_end.strftime("%F %H:%M")}\n"
else
  loop do
    t_start = Time.now
    seconds_until = t_end - t_start
    puts `clear`
    puts formatted_duration(seconds_until) + " until #{t_end.strftime("%F %H:%M")}\n"
    sleep(2)
  end
end
