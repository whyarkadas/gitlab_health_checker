require 'HttpPing/h_ping'
require 'socket'
require 'yaml'

module GitlabHealthChecker
  class GitlabHealthCheck

    def self.ping(choice)

      config = YAML.load_file('config/config.yaml')
      gitlab_url_1 = config['gitlab_url_1']
      gitlab_url_2 = config['gitlab_url_2']

      case choice
        when '1'
          check_remote(gitlab_url_1)
        when '2'
          check_remote(gitlab_url_2)
        else
          puts "You have to choice 1 or 2"
      end

    end

    def self.check_remote(url)
      puts "Check --> " + url
      @http_ping = HttpPing::H_PING.new(url)

      rtary = []
      pingfails = 0
      repeat = 7
      puts 'starting to ping'
      (1..repeat).each do

        if @http_ping.ping
          rtary << @http_ping.duration
          now= Time.new()
          puts  now.hour.to_s + ":" + now.min.to_s + ":"  + now.sec.to_s + " --> " +
                    "#{url} replied in #{@http_ping.duration}"
        else
          pingfails += 1
          puts "timeout"
        end

        sleep(10)

      end
      avg = rtary.inject(0) {|sum, i| sum + i}/(repeat - pingfails)
      puts "Average round-trip is #{avg}\n"
      puts "#{pingfails} packets were droped"
    end

  end
end