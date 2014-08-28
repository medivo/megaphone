namespace :megaphone do

  def git_hub_url(project_name, git_hash)
    "https://github.com/medivo/#{project_name}/commit/#{git_hash}"
  end

  def speak(message)
    cf = Megaphone::Campfire.new(room_name: 'Medivo iTeam', ssl: true, token: CAMPFIRE_TOKEN)
    cf.speak(message)
  end

  desc "Send campfire deploy notification on succesful deploy."
  task :success do
    project_name = ENV['PROJECT_NAME'] || "UNKOWN"
    git_hash = ENV['GIT_HASH'] || "UNKOWN"
    url = git_hub_url(project_name, git_hash)
    speak(":panda_face: [Production Deploy] #{project_name} was deployed: #{url}")
  end

  desc "Send campfire deploy notification on deploy failure."
  task :failure do
    project_name = ENV['PROJECT_NAME'] || "UNKOWN"
    git_hash = ENV['GIT_HASH'] || "UNKOWN"
    url = git_hub_url(project_name, git_hash)
    speak(":poop: [Production Deploy] #{project_name} deploy failure: #{url}")
  end

end


