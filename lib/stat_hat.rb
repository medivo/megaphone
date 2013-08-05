module Megaphone

  class StatHat
    def post_count(code, stat_name = 'tickets', count = 1, timestamp = nil)
      stat = ::StatHat::API.ez_post_count(stat_name, code, count, timestamp)
      puts "StatHat says: #{stat.status} #{stat.msg}"
    end

    def post_value(code, stat_name = 'tickets', value = 0, timestamp = nil)
      stat = ::StatHat::API.ez_post_value(stat_name, code, value, timestamp)
      puts "StatHat says: #{stat.status} #{stat.msg}"
    end
  end

end
