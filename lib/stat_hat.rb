module Megaphone

  class StatHat
    def post_count(code, stat_name = 'tickets', count = 1, timestamp = nil)
      stat = ::StatHat::API.ez_post_count(stat_name, code, count, timestamp)
      puts "StatHat says: #{interpret_status stat}"
    end

    def post_value(code, stat_name = 'tickets', value = 0, timestamp = nil)
      stat = ::StatHat::API.ez_post_value(stat_name, code, value, timestamp)
      puts "StatHat says: #{interpret_status stat}"
    end

    def interpret_status(stat)
      stat.respond_to?(:status) ? "#{stat.status} #{stat.msg}" : (stat && 'success' || 'failure')
    end
  end

end
