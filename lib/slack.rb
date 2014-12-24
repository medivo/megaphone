module Megaphone

  class slack
    attr_reader :session, :room

    def initialize(args)
      @token = args.fetch(:token)
      @channel = args.fetch(:room_name) ||= "#engineering"
      @username = args.fetch(:username) ||= "notifier"
      @room = @channel#for compatibility? not sure if it is is needed.
      establish_session
    end

    def establish_session
      @session = Slack::Notifier.new(@token, channel: @channel,  username: @username})
    end

    def speak(msg)
      @session.ping msg
    end

    def paste(msg)
      self.speak "``` #{msg} ```"
    end

    def speak_just_deployed_message(application, rails_env, latest_hash)
      self.speak(":satellite: [CAP #{application.upcase}] #{ENV['USER']} just deployed #{application} to #{rails_env}: revision #{latest_hash}")
    end

    def speak_last_commit(application, github_project_name, latest_hash)
      self.speak(":satellite: [CAP #{application.upcase}] Last commit: https://github.com/medivo/#{github_project_name}/commit/#{latest_hash}")
    end


    def version(app, env)
      response = env == "staging" ? "#{app}-#{env}" : "#{app}"
      ":satellite: [CAP #{app.upcase}] version: https://#{response}.medivo.com/version.html" unless response.empty?
    end

  end

end

#Notes on formatting rules: https://api.slack.com/docs/formatting