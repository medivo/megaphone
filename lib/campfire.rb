module Megaphone

  class Campfire
    attr_reader :session, :room

    def initialize(args)
      @room_name = args.fetch(:room_name)
      @ssl = args.fetch(:ssl)
      @token = args.fetch(:token)
      establish_session
      find_room
    end

    def establish_session
      @session = Tinder::Campfire.new('medivo', { :token => @token, :ssl => @ssl })
    end

    def find_room
      @room = @session.find_room_by_name(@room_name)
    end

    def speak(msg)
      @room.speak msg
    end

    def paste(msg)
      @room.paste msg
    end

    def speak_just_deployed_message(application, rails_env, latest_hash)
      self.speak(":satellite: [CAP #{application.upcase}] #{ENV['USER']} just deployed #{application} to #{rails_env}: revision #{latest_hash}")
    end

    def speak_last_commit(application, github_project_name, latest_hash)
      self.speak(":satellite: [CAP #{application.upcase}] Last commit: https://github.com/medivo/#{github_project_name}/commit/#{latest_hash}")
    end

    #def repository(repository_string)
      #repository_string.split('/')[1].split('.')[0]
    #end

    def version(app, env)
      response = env == "staging" ? "#{app}-#{env}" : "#{app}"
      #if env == "staging"
        #response = "#{app}-#{env}"
      #else
        #response = "#{app}"
      #end
      ":satellite: [CAP #{app.upcase}] version: https://#{response}.medivo.com/version.html" unless response.empty?
    end

  end

end
