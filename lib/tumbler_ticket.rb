module Megaphone

  class TumblerTicket

    def initialize(args)
      @application = args.fetch(:application)
      @deployer_name = args.fetch(:deployer_name)
      @rails_env = args.fetch(:rails_env)
      @git_hash = args.fetch(:git_hash)
      @uri = args.fetch(:uri)
      @tumbler_api_key = args.fetch(:tumbler_api_key)
    end

    def make_post_request
      headers = {'Content-Type' =>'application/json', 'Accept' => 'application/json'}
      req = Net::HTTP::Post.new("/tickets", headers)

      body = {"api_key" => @tumbler_api_key,
              :ticket => {"dev_name" => @deployer_name, "git_hash" => @git_hash, "app_name" => @application, "env_name" => @rails_env}}.to_json

      req.body = body
      uri = URI.parse(@uri)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.scheme == "https"
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      response = http.request(req)
      puts "Response #{response.code} #{response.message}: #{response.body}"
    end

  end
end
