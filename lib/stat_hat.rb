module Megaphone

  class StatHat
    def post_count(code)
      stat = StatHat::API.ez_post_count("tickets", code, 1)
      puts "StatHat says: #{stat.status} #{stat.msg}"
    end
  end

end
