require 'thor'
require_relative '../gitlab_health_checker'

module GitlabHealthChecker
  class CLI < Thor

    desc "ping choice", "choice :1 for https://gitlab.com, choice :2  for https://about.gitlab.com"
    def ping(choice)
      puts GitlabHealthChecker::GitlabHealthCheck.ping(choice)
    end
  end
end