module Megaphone

  class OpsGenie

    def send(application, app_env, deployer, mode, customer_key, recipient)
      message = "#{deployer} deployed #{application} #{app_env}." if mode == :monitor

      req = Net::HTTP::Post.new("/v1/json/alert", {'Content-Type' =>'application/json'})
      req.body = {"customerKey" => customer_key,
                 "message" => message,
                 "recipients" => recipient}.to_json
      response = Net::HTTP.new('api.opsgenie.com').start {|http| http.request(req) }
      puts "Response #{response.code} #{response.message}: #{response.body}"
    end

  end

end
